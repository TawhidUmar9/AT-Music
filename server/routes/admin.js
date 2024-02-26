const express = require("express");
const router = express.Router();
const db = require('../db');


//add song

// Update Song
router.put("/song/:name", async (req, res) => {
    try {
        const songName = req.params.name;
        const { artist, genre, popularity } = req.body;

        // Construct the SQL query to update the song
        const query = `UPDATE SONG 
                       SET ARTIST_ID = $1, GENRE_ID = $2, POPULARITY = $3 
                       WHERE LOWER(NAME) = LOWER($4)`;

        // Execute the query to update the song
        await db.query(query, [artist, genre, popularity, songName]);

        // Send response indicating successful update
        res.status(200).json({
            status: "success",
            message: `Song '${songName}' updated successfully`
        });
    } catch (err) {
        console.error(err); // Log the error for debugging
        res.status(500).json({
            status: "error",
            message: err.message // Return the specific error message
        });
    }
});

//Delete song
router.delete("/song/:songID", async (req, res) => {
    try {
        const songID = req.params.songID;
        if (!songID) {
            return res.status(400).json({
                status: "error",
                message: "Song ID is required"
            });
        }
        const query = `DELETE FROM SONG WHERE song_id = $1`;
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
        const query = `DELETE FROM SONG WHERE song_id = $1`;
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


//add artist

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
        const query = `INSERT INTO artist (artist_name, alias, small_biography) 
                       VALUES ($1, $2, $3) RETURNING *`;
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