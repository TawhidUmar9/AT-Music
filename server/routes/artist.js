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
            JOIN AWARDS AW ON A.ARTIST_ID = AW.ARTIST_ID
            JOIN AWARDS_LIST AWL ON AW.AWARD_ID = AWL.AWARD_ID
            WHERE LOWER(A.ARTIST_NAME) LIKE $1 OR $1 IS NULL`,
            [artist]
        );

        console.log('api/v1/get searched artist');
        res.status(200).json({
            status: "success",
            results: results.rows.length,
            data: {
                artist: results.rows,
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