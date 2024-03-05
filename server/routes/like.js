const express = require("express");
const router = express.Router();
const db = require('../db');

router.post("/song", async (req, res) => {
    try {
        const { user_id, song_id } = req.body;
        if (!user_id || !song_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Song ID are required"
            });
        }
        const checkQuery = `SELECT * FROM liked_song WHERE user_id = $1 AND song_id = $2`;
        const checkResult = await db.query(checkQuery, [user_id, song_id]);

        if (checkResult.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "User has already liked this song"
            });
        }

        const insertQuery = `INSERT INTO liked_song (user_id, song_id) VALUES ($1, $2)`;

        // Execute the query to insert the liked song
        await db.query(insertQuery, [user_id, song_id]);

        // Send response indicating successful addition
        res.status(200).json({
            status: "success",
            message: `Song '${song_id}' added to liked songs for user '${user_id}'`
        });
    } catch (err) {
        console.error(err); // Log the error for debugging
        res.status(500).json({
            status: "error",
            message: "Internal Server Error" // Generic error message
        });
    }
});
router.post("/artist", async (req, res) => {
    try {
        const { user_id, artist_id } = req.body;

        // Validate required fields
        if (!user_id || !artist_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Artist ID are required"
            });
        }
        const checkQuery = `SELECT * FROM liked_artist WHERE user_id = $1 AND artist_id = $2`;
        const checkResult = await db.query(checkQuery, [user_id, artist_id]);

        if (checkResult.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "User has already liked this artist"
            });
        }

        // Construct the SQL query to insert the liked artist
        const query = `INSERT INTO liked_artist (user_id, artist_id) VALUES ($1, $2)`;

        // Execute the query to insert the liked artist
        await db.query(query, [user_id, artist_id]);

        // Send response indicating successful addition
        res.status(200).json({
            status: "success",
            message: `Artist '${artist_id}' added to liked artists for user '${user_id}'`
        });
    } catch (err) {
        console.error(err); // Log the error for debugging
        res.status(500).json({
            status: "error",
            message: "Internal Server Error" // Generic error message
        });
    }
});
router.post("/album", async (req, res) => {
    try {
        const { user_id, album_id } = req.body;

        // Validate required fields
        if (!user_id || !album_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Album ID are required"
            });
        }
        const checkQuery = `SELECT * FROM liked_album WHERE user_id = $1 AND album_id = $2`;
        const checkResult = await db.query(checkQuery, [user_id, album_id]);

        if (checkResult.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "User has already liked this album"
            });
        }
        // Construct the SQL query to insert the liked album
        const query = `INSERT INTO liked_album (user_id, album_id) VALUES ($1, $2)`;

        // Execute the query to insert the liked album
        await db.query(query, [user_id, album_id]);

        // Send response indicating successful addition
        res.status(200).json({
            status: "success",
            message: `Album '${album_id}' added to liked albums for user '${user_id}'`
        });
    } catch (err) {
        console.error(err); // Log the error for debugging
        res.status(500).json({
            status: "error",
            message: "Internal Server Error" // Generic error message
        });
    }
});
router.post("/genre", async (req, res) => {
    try {
        const { user_id, genre_id } = req.body;

        // Validate required fields
        if (!user_id || !genre_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Genre ID are required"
            });
        }

        // Check if the user has already liked the genre
        const checkQuery = `SELECT * FROM liked_genre WHERE user_id = $1 AND genre_id = $2`;
        const checkResult = await db.query(checkQuery, [user_id, genre_id]);

        if (checkResult.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "User has already liked this genre"
            });
        }

        // Construct the SQL query to insert the liked genre
        const query = `INSERT INTO liked_genre (user_id, genre_id) VALUES ($1, $2)`;

        // Execute the query to insert the liked genre
        await db.query(query, [user_id, genre_id]);

        // Send response indicating successful addition
        res.status(200).json({
            status: "success",
            message: `Genre '${genre_id}' added to liked genres for user '${user_id}'`
        });
    } catch (err) {
        console.error(err); // Log the error for debugging
        res.status(500).json({
            status: "error",
            message: "Internal Server Error" // Generic error message
        });
    }
});

module.exports = router;