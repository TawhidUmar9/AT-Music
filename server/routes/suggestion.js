const express = require("express");
const router = express.Router();
const db = require('../db');

router.get("/song", async (req, res) => {
    try {
        const suggested_songs = await db.query(`
            SELECT * FROM song 
            WHERE genre_id IN 
                (SELECT genre_id FROM liked_genre WHERE user_id = $1)`,
            [req.user.id]);
        res.status(200).json({
            status: 'success',
            results: suggested_songs.rows.length,
            data: {
                suggestion: suggested_songs.rows
            }
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({
            status: 'error',
            message: 'Internal server error'
        });
    }
});


router.get("/artist", async (req, res) => {
    try {
        const suggested_songs = await db.query(
            `SELECT * 
            FROM artist 
            LEFT JOIN song 
            ON artist.artist_id = song.artist_id 
            WHERE genre_id IN 
                (SELECT genre_id FROM liked_genre WHERE user_id = $1)`,
            [req.user.id]
        );

        res.status(200).json({
            status: 'success',
            results: suggested_songs.rows.length,
            data: { suggestion: suggested_songs.rows }
        });

    } catch (err) {
        console.log(err);

        res.status(500).json({
            status: 'error',
            message: 'Internal server error'
        });

    }
});


module.exports = router;

module.exports = router;