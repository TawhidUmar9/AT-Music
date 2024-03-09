const express = require("express");
const router = express.Router();
const db = require('../db');


//add song
router.post("/song", async (req, res) => {
    try {
        const { song_name, artist_name, album_name, album_year, composer_name,
            composer_biography, composer_gender, composer_nationality,
            lyricist_name, lyricist_biography, lyricist_gender, lyricist_nationality,
            producer_biography, producer_gender, producer_nationality,
            age_rating, genre_name, price, popularity = 0, producer_name, synopsis,
            recording_type, platform_type, song_length,
        } = req.body;
        if (!song_name || !artist_name || !album_name || !age_rating || !genre_name || !price
            || !recording_type || !platform_type || !song_length) {
            return res.status(400).json({
                status: "error",
                message: "Song name, artist name, " +
                    "album name, age rating, genre name, and price are required"
            });
        }

        // Call the stored procedure with the updated parameters
        const result = await db.query('CALL add_song($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11,' +
            ' $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23)',
            [song_name, artist_name, album_name, album_year, composer_name,
                composer_biography, composer_gender, composer_nationality,
                lyricist_name, lyricist_biography, lyricist_gender, lyricist_nationality,
                producer_biography, producer_gender, producer_nationality,
                age_rating, genre_name, price, producer_name, synopsis,
                recording_type, platform_type, song_length]);

        res.status(201).json({
            status: "success",
            message: `Song '${song_name}' added successfully`,
            data: result.rows[0]
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Failed to add song"
        });
    }
});
module.exports = router;