const express = require("express");
const router = express.Router();
const db = require('../db');

const reviewRoute = require('./review');
const songHomeRoute = require('./songhome');


router.use('/', reviewRoute);
router.use('/', songHomeRoute);

router.get("/", async (req, res) => {
    try {
        const { search, sortBy, sortOrder, artist, genre } = req.query;
        const queryParams = [];
        let query = `
            SELECT *
            FROM SONG S
            JOIN ARTIST A ON S.ARTIST_ID = A.ARTIST_ID
            JOIN ALBUM AL ON S.ALBUM_ID = AL.ALBUM_ID
            JOIN GENRE G ON S.GENRE_ID = G.GENRE_ID
            WHERE 1=1`;

        if (search) {
            query += ` AND LOWER(S.NAME) LIKE LOWER($${queryParams.length + 1})`;
            queryParams.push(`%${search.toLowerCase()}%`);
        }
        if (artist) {
            query += ` AND LOWER(A.ARTIST_NAME) LIKE LOWER($${queryParams.length + 1})`;
            queryParams.push(`%${artist.toLowerCase()}%`);
        }
        if (genre) {
            query += ` AND LOWER(G.GENRE_NAME) LIKE LOWER($${queryParams.length + 1})`;
            queryParams.push(`%${genre.toLowerCase()}%`);
        }
        if (sortBy) {
            query += ` ORDER BY S.${sortBy.toUpperCase()}`;
        }
        if (sortOrder) {
            query += `  ${sortOrder.toUpperCase()}`;
        }


        const results = await db.query(query, queryParams);
        res.status(200).json({
            status: "success",
            results: results.rows.length,
            data: results.rows
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: err.message
        });
    }
});


module.exports = router;