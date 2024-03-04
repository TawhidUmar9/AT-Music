const express = require("express");
const router = express.Router();
const db = require('../db');

//get one or more artist!
router.get("/", async (req, res) => {
    try {
        const results =
            await db.query(`SELECT * 
              FROM ARTIST A`);
        console.log('api/v1/artist');
        res.status(200).json({
            status: "success",
            results: results.rows.length,
            data: {
                artist: results.rows,
            },
        });
    } catch (err) {
        console.log(err);
    }
});

router.get("/:artistName", async (req, res) => {
    try {
        // Extract artistName from request parameters
        const artistName = req.params.artistName;
        const { user_id } = req.query;

        // If artistName is not provided, return a 400 error
        if (!artistName) {
            return res.status(400).json({
                status: "error",
                message: "Artist name is required."
            });
        }

        // Normalize empty fields to null
        const artist = artistName === 'null' ? null : `%${artistName.toLowerCase()}%`;

        const results = await db.query(
            `SELECT * 
            FROM ARTIST A
            WHERE LOWER(A.ARTIST_NAME) LIKE $1 OR $1 IS NULL`,
            [artist]
        );
        const artist_liked_query = `
            SELECT * from liked_artist 
            where user_id = $1 and artist_id = $2`;
        const liked_artist = 
            await db.query(artist_liked_query, [user_id, results.rows[0].artist_id]);
        
        

        const artist_id = results.rows[0].artist_id;
        const artist_awards = await db.query(
            `SELECT * 
            FROM AWARDS AW
            JOIN AWARDS_LIST AWL ON AW.AWARD_ID = AWL.AWARD_ID
            WHERE AW.ARTIST_ID = $1`,
            [artist_id]
        );

        res.status(200).json({
            status: "success",
            results: results.rows.length,
            data: {
                artist: results.rows,
                awards: artist_awards.rows,
                liked: liked_artist.rows.length > 0
            },
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