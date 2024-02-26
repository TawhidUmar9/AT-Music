const express = require("express");
const router = express.Router();
const db = require('../db');


// ----> sorts the song on the basis of the popluarity

//http://localhost:4001/api/v1/song?search=B&sortBy=popularity&sortOrder=asc&artist=m
//this is a demo url which hits this get method.

router.get("/", async (req, res) => {
    try {
        const { search, sortBy = 'popularity', sortOrder = 'desc', artist, genre } = req.query;

        // Use an array to store query parameters
        const queryParams = [];

        let query = `SELECT SONG_ID, NAME, GENRE_NAME, POPULARITY FROM SONG S
        JOIN ARTIST A ON S.ARTIST_ID = A.ARTIST_ID
        JOIN GENRE G ON S.GENRE_ID = G.GENRE_ID`;

        if (search) {
            query += ` WHERE LOWER(NAME) LIKE LOWER($1) OR $1 IS NULL`;
            // Push the lowercase search parameter to the array
            queryParams.push(`%${search.toLowerCase()}%`);
        }

        // Handle artist query
        if (artist) {
            query += ` AND LOWER(A.ARTIST_NAME) LIKE LOWER($2) OR $2 IS NULL`;
            // Push the lowercase artist parameter to the array
            queryParams.push(`%${artist.toLowerCase()}%`);
        }

        // Handle genre query
        if (genre) {
            // Split the genre string into an array of individual genres
            const genres = genre.split(',');
            // Generate the SQL condition for matching any of the specified genres
            const genreConditions =
                genres.map((g, index) => `$${index + queryParams.length + 1}`);
            query += ` AND LOWER(G.GENRE_NAME) IN (${genreConditions.join(', ')})`;
            // Push each lowercase genre parameter to the array
            queryParams.push(...genres.map(genre => genre.toLowerCase()));
        }

        // Add ORDER BY clause for sorting
        const sanitizedSortBy =
            ['name', 'genre_id'].includes(sortBy.toLowerCase()) ? sortBy : 'popularity';
        const sanitizedSortOrder =
            sortOrder.toUpperCase() === 'ASC' ? 'ASC' : 'DESC';
        query += ` ORDER BY ${sanitizedSortBy} ${sanitizedSortOrder}, popularity DESC`;

        // Execute the constructed query with parameterized queries
        const results = await db.query(query, queryParams);

        // Send response with the results
        res.status(200).json({
            status: "success",
            results: results.rows.length,
            data: results.rows
        });
    } catch (err) {
        console.error(err); // Log the error for debugging
        res.status(500).json({
            status: "error",
            message: err.message // Return the specific error message
        });
    }
});
router.get("/", async (req, res) => {
    try {
        const { search, sortBy = 'popularity', sortOrder = 'desc', artist, genre } = req.query;

        // Use an array to store query parameters
        const queryParams = [];

        let query = `SELECT NAME, GENRE_NAME, POPULARITY FROM SONG S
        JOIN ARTIST A ON S.ARTIST_ID = A.ARTIST_ID
        JOIN GENRE G ON S.GENRE_ID = G.GENRE_ID`;

        if (search) {
            query += ` WHERE LOWER(NAME) LIKE LOWER($1) OR $1 IS NULL`;
            // Push the lowercase search parameter to the array
            queryParams.push(`%${search.toLowerCase()}%`);
        }

        // Handle artist query
        if (artist) {
            query += ` AND LOWER(A.ARTIST_NAME) LIKE LOWER($2) OR $2 IS NULL`;
            // Push the lowercase artist parameter to the array
            queryParams.push(`%${artist.toLowerCase()}%`);
        }

        // Handle genre query
        if (genre) {
            // Split the genre string into an array of individual genres
            const genres = genre.split(',');
            // Generate the SQL condition for matching any of the specified genres
            const genreConditions =
                genres.map((g, index) => `$${index + queryParams.length + 1}`);
            query += ` AND LOWER(G.GENRE_NAME) IN (${genreConditions.join(', ')})`;
            // Push each lowercase genre parameter to the array
            queryParams.push(...genres.map(genre => genre.toLowerCase()));
        }

        // Add ORDER BY clause for sorting
        const sanitizedSortBy =
            ['name', 'genre_id'].includes(sortBy.toLowerCase()) ? sortBy : 'popularity';
        const sanitizedSortOrder =
            sortOrder.toUpperCase() === 'ASC' ? 'ASC' : 'DESC';
        query += ` ORDER BY ${sanitizedSortBy} ${sanitizedSortOrder}, popularity DESC`;

        // Execute the constructed query with parameterized queries
        const results = await db.query(query, queryParams);

        // Send response with the results
        res.status(200).json({
            status: "success",
            results: results.rows.length,
            data: results.rows
        });
    } catch (err) {
        console.error(err); // Log the error for debugging
        res.status(500).json({
            status: "error",
            message: err.message // Return the specific error message
        });
    }
});
router.get("/", async (req, res) => {
    try {
        const { search, sortBy = 'popularity',
            sortOrder = 'desc', artist, genre } = req.query;
        const queryParams = [];

        let query =
            `SELECT NAME, GENRE_NAME, POPULARITY FROM SONG S
            JOIN ARTIST A ON S.ARTIST_ID = A.ARTIST_ID
            JOIN GENRE G ON S.GENRE_ID = G.GENRE_ID`;

        if (search) {
            query += ` WHERE LOWER(NAME) LIKE LOWER($1) OR $1 IS NULL`;
            queryParams.push(`%${search.toLowerCase()}%`);
        }

        // Handle artist query
        if (artist) {
            query += ` AND LOWER(A.ARTIST_NAME) LIKE LOWER($2) OR $2 IS NULL`;
            // Push the lowercase artist parameter to the array
            queryParams.push(`%${artist.toLowerCase()}%`);
        }

        // Handle genre query
        if (genre) {
            const genres = genre.split(',');
            const genreConditions =
                genres.map((g, index) => `$${index + queryParams.length + 1}`);
            query += ` AND LOWER(G.GENRE_NAME) IN (${genreConditions.join(', ')})`;
            queryParams.push(...genres.map(genre => genre.toLowerCase()));
        }

        // Add ORDER BY clause for sorting
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


module.exports = router;