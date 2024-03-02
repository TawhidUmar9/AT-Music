const express = require("express");
const router = express.Router();
const db = require('../db');


//route to get news of liked entities
//example of subquery and join.

router.get("/news", async (req, res) => {
    try {

        const { user_id } = req.body;
        if (!user_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID is required"
            });
        }

        //get news of liked song

        const songNewsQuery = `SELECT * FROM song_news SN
                JOIN song S ON S.SONG_ID = SN.SONG_ID
                WHERE SN.song_id IN (SELECT song_id from liked_song where user_id = $1)`
        const songNewsResult = await db.query(songNewsQuery, [user_id]);

        const artistNewsQuery = `SELECT * FROM artist_news AN
                JOIN artist A ON A.ARTIST_ID = AN.ARTIST_ID
                WHERE AN.ARTIST_ID IN (SELECT artist_id from liked_artist where
                    user_id = $1)`
        const artistNewsResult = await db.query(artistNewsQuery, [user_id]);

        res.status(200).json({
            status: "success",
            data: {
                songNewsResult: songNewsResult.rows,
                artistNewsResult: artistNewsResult.rows
            }
        });

    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error",
        });
    }
})

module.exports = router;