const express = require("express");
const router = express.Router();
const db = require('../db');

router.post("/review", async (req, res) => {
    try {
        const { user_id, song_id, review_text, rating } = req.body;
        if (!user_id || !song_id || !rating) {
            return res.status(400).json({
                status: "error",
                message: "User ID, Song ID, Review Text, and Rating are required"
            });
        }
        if (rating > 10) {
            return res.status(400).json({
                status: "error",
                message: "Rating cannot be greater than 10"
            });
        }

        // Check if the review already exists for the user and song
        const checkQuery = `SELECT * FROM reviews WHERE user_id = $1 AND song_id = $2`;
        const checkResult = await db.query(checkQuery, [user_id, song_id]);

        if (checkResult.rows.length > 0) {
            // If the review already exists, update it
            const updateQuery = `
                UPDATE reviews
                SET review_text = $1, rating = $2, review_date = $3
                WHERE user_id = $4 AND song_id = $5
            `;
            await db.query(updateQuery, [review_text, rating, new Date(), user_id, song_id]);
        } else {
            // If the review doesn't exist, insert a new one
            const insertQuery = `
                INSERT INTO reviews (user_id, song_id, review_text, rating, review_date)
                VALUES ($1, $2, $3, $4, $5)
            `;
            await db.query(insertQuery, [user_id, song_id, review_text, rating, new Date()]);
        }

        res.status(200).json({
            status: "success",
            message: `Review added successfully`
        });

    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
});

router.get("/review/:song_id", async (req, res) => {
    try {
        const song_id = req.params.song_id;
        const query = `
            SELECT 
                R.review_id, R.user_id, 
                R.song_id, R.review_text, 
                R.rating, R.review_date, 
                U.username,
                S.popularity
            FROM 
                reviews R
            JOIN 
                user_db U ON R.user_id = U.user_id
            JOIN
                song S ON R.song_id = S.song_id
            WHERE 
                R.song_id = $1
        `;
        const results = await db.query(query, [song_id]);

        res.status(200).json({
            status: "success",
            results: results.rows.length,
            data: results.rows
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
});

module.exports = router;