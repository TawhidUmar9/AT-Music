const express = require("express");
const router = express.Router();
const db = require('../db');


const addSongRoute = require('./addsong');
const newsRoute = require('./admin_news_handler');
const awardsRoute = require('./admin_award_handler');

router.use('/', addSongRoute);
router.use('/', newsRoute);
router.use('/', awardsRoute);

// Route to get counts of different entities
router.get("/counts", async (req, res) => {
    try {
        const counts = {};
        const entities = ['song', 'artist', 'album', 'genre', 'platform', 'rec_type', 'user_db'];
        for (const entity of entities) {
            const result = await db.query(`SELECT COUNT(*) FROM ${entity}`);
            counts[entity + 'Count'] = result.rows[0].count;
        }
        res.status(200).json({
            status: "success",
            data: counts
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal server error"
        });
    }
});

// Route to get all songs
router.get("/songs", async (req, res) => {
    try {
        const results = await db.query(`
            SELECT * 
            FROM song AS S 
            JOIN artist AS A ON S.artist_id = A.artist_id 
            JOIN album AS AL ON S.album_id = AL.album_id 
            JOIN genre AS G ON S.genre_id = G.genre_id
        `);
        console.log('api/v1/songs results:', results.rows.length);
        res.status(200).json({
            status: "success",
            results: results.rows.length,
            data: {
                songs: results.rows,
            },
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error",
        });
    }
});

// Route to get songs by name
router.get("/songs/:name", async (req, res) => {
    try {
        const results = await db.query(`
            SELECT * 
            FROM song AS S 
            JOIN artist AS A ON S.artist_id = A.artist_id 
            JOIN album AS AL ON S.album_id = AL.album_id 
            JOIN genre AS G ON S.genre_id = G.genre_id 
            WHERE LOWER(S.name) LIKE $1
        `, [`%${req.params.name.toLowerCase()}%`]);
        console.log('api/v1/songs by name:', results.rows.length);
        res.status(200).json({
            status: "success",
            data: {
                songs: results.rows,
            },
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error",
        });
    }
});

// Route to update a song
router.put("/songs/:name", async (req, res) => {
    try {
        const songName = req.params.name;
        const { song_name, artist, album, genre } = req.body;
        // Validation checks for required fields
        if (!songName || !artist || !album || !genre || !song_name) {
            return res.status(400).json({
                status: "error",
                message: "Song name, artist name, album name, and genre name are required"
            });
        }
        // Query to update the song
        const query = `
            UPDATE song 
            SET name = $1, artist_id = (SELECT artist_id FROM artist WHERE LOWER(artist_name) = LOWER($2)), 
                album_id = (SELECT album_id FROM album WHERE LOWER(album_name) = LOWER($3)), 
                genre_id = (SELECT genre_id FROM genre WHERE LOWER(genre_name) = LOWER($4))
            WHERE LOWER(name) = LOWER($5)
        `;
        await db.query(query, [song_name, artist, album, genre, songName]);
        res.status(200).json({
            status: "success",
            message: `Song '${songName}' updated successfully`
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: err.message
        });
    }
});

// Route to delete a song
router.delete("/songs/:songID", async (req, res) => {
    try {
        const songID = req.params.songID;
        if (!songID) {
            return res.status(400).json({
                status: "error",
                message: "Song ID is required"
            });
        }
        const query = `DELETE FROM song WHERE song_id = $1`;
        await db.query(query, [songID]);
        res.status(200).json({
            status: "success",
            message: `Song with ID '${songID}' deleted successfully`
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: err.message
        });
    }
});

// Route to add an artist
router.post("/artists", async (req, res) => {
    try {
        const { artist_name, alias, small_biography } = req.body;
        if (!artist_name) {
            return res.status(400).json({
                status: "error",
                message: "Artist name is required"
            });
        }
        const result = await db.query('CALL add_artist($1, $2, $3)', [artist_name, alias, small_biography]);

        res.status(201).json({
            status: "success",
            message: `Artist '${artist_name}' added successfully`,
            data: result.rows[0]
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Failed to add artist"
        });
    }
});


// Add more routes for albums, genres, etc.

module.exports = router;
