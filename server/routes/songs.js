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
        let query = `
            SELECT S.*, A.ARTIST_NAME, AL.ALBUM_NAME, G.GENRE_NAME 
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

        let orderByClause = '';
        if (sortBy === 'popularity') {
            orderByClause = `popularity ${sortOrder.toUpperCase()}`;
        } else if (sortBy === 'price') {
            orderByClause = `price ${sortOrder.toUpperCase()}`;
        } else {
            orderByClause = `${sortBy} ${sortOrder.toUpperCase()}, popularity DESC`;
        }

        query += ` ORDER BY ${orderByClause}`;

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
        const query = `SELECT 
        S.NAME, S.SONG_LENGTH, S.POPULARITY, A.ARTIST_NAME, AL.ALBUM_NAME, G.GENRE_NAME, 
        P.PLATFORM_NAME, RT.RECTYPE_NAME        
        FROM SONG S
        JOIN ARTIST A ON S.ARTIST_ID = A.ARTIST_ID
        JOIN ALBUM AL ON S.ALBUM_ID = AL.ALBUM_ID
        JOIN GENRE G ON S.GENRE_ID = G.GENRE_ID
        JOIN PLATFORM_SONG PS ON S.SONG_ID = PS.SONG_ID
        JOIN RECORDING_SONG RTS ON RTS.SONG_ID = S.SONG_ID
        JOIN PLATFORM P ON PS.PLATFORM_ID = P.PLATFORM_ID
        JOIN REC_TYPE RT ON RTS.RECTYPE_ID = RT.RECTYPE_ID
        WHERE S.song_id = $1`;

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