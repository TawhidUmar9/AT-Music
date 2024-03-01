const express = require("express");
const router = express.Router();
const db = require('../db');


const addSongRoute = require('./addsong');
router.use('/', addSongRoute);


router.get("/", async (req, res) => {
    try {
        const songCount = await db.query("SELECT COUNT(*) FROM song");
        const artistCount = await db.query("SELECT COUNT(*) FROM artist");
        const albumCount = await db.query("SELECT COUNT(*) FROM album");
        const genreCount = await db.query("SELECT COUNT(*) FROM genre");
        const platformCount = await db.query("SELECT COUNT(*) FROM platform");
        const recordingCount = await db.query("SELECT COUNT(*) FROM rec_type");
        const userCount = await db.query("SELECT COUNT(*) FROM user_db");

        res.status(200).json({
            status: "success",
            data: {
                songCount: songCount.rows[0].count,
                artistCount: artistCount.rows[0].count,
                albumCount: albumCount.rows[0].count,
                genreCount: genreCount.rows[0].count,
                platformCount: platformCount.rows[0].count,
                recordingCount: recordingCount.rows[0].count,
                userCount: userCount.rows[0].count
            }
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal server error"
        });
    }
})
router.get("/update", async (req, res) => {
    try {
        const results =
            await db.query("SELECT * FROM SONG S JOIN ARTIST A ON S.artist_id = A.artist_id JOIN ALBUM AL ON S.album_id = AL.album_id");
        console.log('api/v1/getSong results!');
        res.status(200).json({
            status: "success",
            results: results.rows.length,
            data: {
                song: results.rows,
            },
        });
    } catch (err) {
        console.log(err);
    }
});
//update song.
router.put("/song/:name", async (req, res) => {
    try {
        const songName = req.params.name;
        const { song_name, artist, album, genre } = req.body;
        if (!songName || !artist || !album || !genre || !song_name) {
            return res.status(400).json({
                status: "error",
                message: "Song name, artist name, album name, and genre name are required"
            });
        }

        const songQuery = `SELECT * FROM song WHERE LOWER(name) = LOWER($1)`;
        const songResult = await db.query(songQuery, [songName]);
        if (songResult.rows.length === 0) {
            return res.status(404).json({
                status: "error",
                message: "Song with same name exists. Please try another name."
            });
        }

        const artistQuery = `SELECT artist_id FROM artist WHERE LOWER(artist_name) = LOWER($1)`;
        const artistResult = await db.query(artistQuery, [artist]);
        if (artistResult.rows.length === 0) {
            return res.status(404).json({
                status: "error",
                message: "Artist not found"
            });
        }
        const artist_id = artistResult.rows[0].artist_id;

        const albumQuery = `SELECT album_id FROM album WHERE LOWER(album_name) = LOWER($1)`;
        const albumResult = await db.query(albumQuery, [album]);
        if (albumResult.rows.length === 0) {
            return res.status(404).json({
                status: "error",
                message: "Album not found"
            });
        }
        const album_id = albumResult.rows[0].album_id;

        const genreQuery = `SELECT genre_id FROM genre WHERE LOWER(genre_name) = LOWER($1)`;
        const genreResult = await db.query(genreQuery, [genre]);
        if (genreResult.rows.length === 0) {
            return res.status(404).json({
                status: "error",
                message: "Genre not found"
            });
        }
        const genre_id = genreResult.rows[0].genre_id;

        const query = `
        UPDATE song 
        SET name = $5, artist_id = $1, album_id = $2, genre_id = $3 
        WHERE lower(name) = lower($4);`;
        await db.query(query, [artist_id, album_id, genre_id, songName, song_name]);

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
//delete song as admin.
router.delete("/song/:songID", async (req, res) => {
    try {
        const songID = req.params.songID;
        if (!songID) {
            return res.status(400).json({
                status: "error",
                message: "Song ID is required"
            });
        }
        const query = `DELETE FROM SONG WHERE song_id = $1;`;
        await db.query(query, [songID]);
        res.status(200).json({
            status: "success",
            message: `Song with ID '${songID}' deleted successfully`
        });
    } catch (err) {
        console.error(err); // Log the error for debugging
        res.status(500).json({
            status: "error",
            message: err.message // Return the specific error message
        });
    }
});
//add
router.post("/artist", async (req, res) => {
    try {
        const { artist_name, alias, small_biography } = req.body;
        if (!artist_name) {
            return res.status(400).json({
                status: "error",
                message: "Artist name is required"
            });
        }
        const checkQuery = `SELECT * FROM artist WHERE LOWER(artist_name) = LOWER($1)`;
        const checkResult = await db.query(checkQuery, [artist_name]);

        if (checkResult.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "Artist already exists"
            });
        }
        const query = `
        INSERT INTO artist (artist_name, alias, small_biography) 
        VALUES ($1, $2, $3) RETURNING *;`;
        const result = await db.query(query, [artist_name, alias, small_biography]);

        res.status(201).json({
            status: "success",
            message: `Artist '${artist_name}' added successfully`,
            data: result.rows[0] // Return the inserted artist data
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Failed to add artist"
        });
    }
});
router.post("/album", async (req, res) => {
    try {
        const { album_name, artist_name, album_year } = req.body;
        if (!album_name || !artist_name || !album_year) {
            return res.status(400).json({
                status: "error",
                message: "Album name, artist name, and album year are required"
            });
        }
        const checkQuery = `SELECT * FROM album WHERE LOWER(album_name) = LOWER($1)`;
        const checkResult = await db.query(checkQuery, [album_name]);

        if (checkResult.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "Album already exists"
            });
        }
        const artistQuery = `SELECT artist_id FROM artist WHERE LOWER(artist_name) = LOWER($1)`;
        const artistResult = await db.query(artistQuery, [artist_name]);

        // Check if artist exists
        if (artistResult.rows.length === 0) {
            return res.status(404).json({
                status: "error",
                message: "Artist not found"
            });
        }
        const artist_id = artistResult.rows[0].artist_id;
        const albumQuery = `INSERT INTO album (album_name, artist_id, album_year) 
                            VALUES ($1, $2, $3) RETURNING *`;
        const albumResult = await db.query(albumQuery, [album_name, artist_id, album_year]);
        res.status(201).json({
            status: "success",
            message: `Album '${album_name}' by '${artist_name}' added successfully`,
            data: albumResult.rows[0]
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
});
router.post("/genre", async (req, res) => {
    try {
        const { genre_name } = req.body;
        if (!genre_name) {
            return res.status(400).json({
                status: "error",
                message: "Genre name is required"
            });
        }

        // Check if the genre already exists
        const checkQuery = `SELECT * FROM genre WHERE LOWER(genre_name) = LOWER($1)`;
        const checkResult = await db.query(checkQuery, [genre_name]);

        if (checkResult.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "Genre already exists"
            });
        }
        // Insert the genre into the database
        const query = `INSERT INTO genre (genre_name) VALUES ($1) RETURNING *`;
        const result = await db.query(query, [genre_name]);
        // Send response indicating successful addition
        res.status(201).json({
            status: "success",
            message: `Genre '${genre_name}' added successfully`,
            data: result.rows[0]
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Failed to add Genre"
        });
    }
});


module.exports = router;