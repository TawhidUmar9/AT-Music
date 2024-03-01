const express = require("express");
const router = express.Router();
const db = require('../db');

router.delete("/song", async (req, res) => {
    try {
        const { user_id, song_id } = req.body;
        if (!user_id || !song_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Song ID are required"
            });
        }
        const songQuery = `SELECT * FROM liked_song WHERE user_id = $1 AND song_id = $2`;
        const songResult = await db.query(songQuery, [user_id, song_id]);
        if (songResult.rows.length === 0) {
            return res.status(400).json({
                status: "error",
                message: "User has not liked this song"
            });
        }

        const deleteQuery = `DELETE FROM liked_song WHERE user_id = $1 AND song_id = $2`;
        await db.query(deleteQuery, [user_id, song_id]);
        res.status(200).json({
            status: "success",
            message: `Song '${song_id}' removed from liked songs for user '${user_id}'`
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
})
router.delete("/artist", async (req, res) => {
    try {
        const { user_id, artist_id } = req.body;
        if (!user_id || !artist_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Artist ID are required"
            });
        }
        const deleteQuery = `DELETE FROM liked_artist WHERE user_id = $1 AND artist_id = $2`;
        await db.query(deleteQuery, [user_id, artist_id]);
        res.status(200).json({
            status: "success",
            message: `Artist '${artist_id}' removed from liked artists for user '${user_id}'`
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
})
router.delete("/album", async (req, res) => {
    try {
        const { user_id, album_id } = req.body;
        if (!user_id || !album_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Album ID are required"
            });
        }
        const deleteQuery = `DELETE FROM liked_album WHERE user_id = $1 AND album_id = $2`;
        await db.query(deleteQuery, [user_id, album_id]);
        res.status(200).json({
            status: "success",
            message: `Album '${album_id}' removed from liked albums for user '${user_id}'`
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
})
router.delete("/genre", async (req, res) => {
    try {
        const { user_id, genre_id } = req.body;
        if (!user_id || !genre_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Genre ID are required"
            });
        }
        const deleteQuery = `DELETE FROM liked_genre WHERE user_id = $1 AND genre_id = $2`;
        await db.query(deleteQuery, [user_id, genre_id]);
        res.status(200).json({
            status: "success",
            message: `Genre '${genre_id}' removed from liked genres for user '${user_id}'`
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
})

module.exports = router;