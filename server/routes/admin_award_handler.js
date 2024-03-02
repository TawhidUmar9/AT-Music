const express = require("express");
const router = express.Router();
const db = require('../db');


//route to get all awards
router.get("/awards", async (req, res) => {
    try {
        const results = await db.query(`
            SELECT * 
            FROM awards_list
        `);
        res.status(200).json({
            status: "success",
            data: {
                awards: results.rows,
            },
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error",
        });
    }
});

//route to add awards to the awards_list
router.post("/awards", async (req, res) => {
    try {
        const { award_name, artist_name, award_year } = req.body;
        if (!award_name || !artist_name || !award_year) {
            return res.status(400).json({
                status: "error",
                message: "Award name, artist name, and award year are required"
            });
        }
        const checkArtistQuery = `SELECT * FROM artist WHERE LOWER(artist_name) = LOWER($1)`;
        const checkArtistResult = await db.query(checkArtistQuery, [artist_name]);
        if (checkArtistResult.rows.length === 0) {
            return res.status(404).json({
                status: "error",
                message: "Artist not found"
            });
        }
        const artist_id = checkArtistResult.rows[0].artist_id;

        const checkAwardsQuery = `
            SELECT * FROM awards_list WHERE LOWER(award_name) = LOWER($1)`;
        const checkAwardsResult = await db.query(checkAwardsQuery, [award_name]);

        if (checkAwardsResult.rows.length === 0) {
            return res.status(404).json({
                status: "error",
                message: "Award not found"
            });
        }
        const award_id = checkAwardsResult.rows[0].award_id;

        const query = `INSERT INTO awards(award_id, artist_id, awards_year)
        VALUES ($1, $2, $3) RETURNING *`;
        const result = await db.query(query, [award_id, artist_id, award_year]);
        res.status(200).json({
            status: "success"
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error",
        });
    }
});


module.exports = router;