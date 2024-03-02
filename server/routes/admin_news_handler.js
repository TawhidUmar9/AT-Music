const express = require("express");
const router = express.Router();
const db = require('../db');


//route to add the news

router.post("/news", async (req, res) => {
    try {

        const { flag, name, news_title, news_content } = req.body;
        if (!flag || !name || !news_title || !news_content) {
            return res.status(400).json({
                status: "error",
                message: "Flag, name, news title, and news content are required"
            });
        }
        if (flag === 'artist') {
            const checkQuery = `SELECT * FROM artist WHERE LOWER(artist_name) = LOWER($1)`;
            const checkResult = await db.query(checkQuery, [name]);
            if (checkResult.rows.length === 0) {
                return res.status(404).json({
                    status: "error",
                    message: "Artist not found"
                });
            }
            const artist_id = checkResult.rows[0].artist_id;
            const insertQuery = `
                INSERT INTO artist_news (title, artist_id , content, created_at) 
                VALUES ($1, $2, $3, $4)`;
            await db.query(insertQuery, [news_title, artist_id, news_content, new Date()]);
            res.status(200).json({
                status: "success",
                message: "News added successfully"
            });

        } else if (flag === 'song') {
            const checkQuery = `SELECT * FROM song WHERE LOWER(name) = LOWER($1)`;
            const checkResult = await db.query(checkQuery, [name]);
            if (checkResult.rows.length === 0) {
                return res.status(404).json({
                    status: "error",
                    message: "Song not found"
                });
            }
            const song_id = checkResult.rows[0].song_id;
            const insertQuery = `
                INSERT INTO song_news (title, song_id, content, created_at) 
                VALUES ($1, $2, $3, $4)`;
            await db.query(insertQuery, [news_title, song_id, news_content, new Date()]);
            res.status(200).json({
                status: "success",
                message: "News added successfully"
            });
        }

    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: err.message
        });
    }
})



module.exports = router;