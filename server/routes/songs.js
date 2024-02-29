const express = require("express");
const router = express.Router();
const db = require('../db');


// ----> sorts the song on the basis of the popluarity

//http://localhost:4001/api/v1/song?search=B&sortBy=popularity&sortOrder=asc&artist=m
//this is a demo url which hits this get method.

router.get("/", async (req, res) => {
    try {
        const { search, sortBy = 'popularity', sortOrder = 'desc', artist, genre } = req.query;
        const queryParams = [];
        let query = `SELECT * FROM SONG S
        JOIN ARTIST A ON S.ARTIST_ID = A.ARTIST_ID
        JOIN ALBUM AL ON S.ALBUM_ID = AL.ALBUM_ID
        JOIN GENRE G ON S.GENRE_ID = G.GENRE_ID`;

        if (search) {
            query += ` WHERE LOWER(NAME) LIKE LOWER($1) OR $1 IS NULL`;
            queryParams.push(`%${search.toLowerCase()}%`);
        }
        if (artist) {
            query += ` AND LOWER(A.ARTIST_NAME) LIKE LOWER($2) OR $2 IS NULL`;
            queryParams.push(`%${artist.toLowerCase()}%`);
        }
        if (genre) {
            const genres = genre.split(',');
            const genreConditions =
                genres.map((g, index) => `$${index + queryParams.length + 1}`);
            query += ` AND LOWER(G.GENRE_NAME) IN (${genreConditions.join(', ')})`;
            queryParams.push(...genres.map(genre => genre.toLowerCase()));
        }
        const sanitizedSortBy =
            ['name', 'genre_id'].includes(sortBy.toLowerCase()) ? sortBy : 'popularity';
        const sanitizedSortOrder =
            sortOrder.toUpperCase() === 'ASC' ? 'ASC' : 'DESC';
        query += ` ORDER BY ${sanitizedSortBy} ${sanitizedSortOrder}, popularity DESC`;
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

router.get("/:song_id", async (req, res) => {
    try {
        const song_id = req.params.song_id;
        const query = `SELECT * FROM SONG S
        JOIN ARTIST A ON S.ARTIST_ID = A.ARTIST_ID
        JOIN ALBUM AL ON S.ALBUM_ID = AL.ALBUM_ID
        JOIN GENRE G ON S.GENRE_ID = G.GENRE_ID
        WHERE song_id = $1`;
        const result = await db.query(query, [song_id]);
        res.status(200).json({
            status: "success",
            data: result.rows[0]
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: err.message
        });
    }
})


module.exports = router;