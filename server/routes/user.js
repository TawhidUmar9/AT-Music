const express = require("express");
const router = express.Router();
const db = require('../db');
const { route } = require("./songs");


//these routes handle the user like funcitonality
router.post("/song", async (req, res) => {
    try {
        const { user_id, song_id } = req.body;
        if (!user_id || !song_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Song ID are required"
            });
        }
        const checkQuery = `SELECT * FROM liked_song WHERE user_id = $1 AND song_id = $2`;
        const checkResult = await db.query(checkQuery, [user_id, song_id]);

        if (checkResult.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "User has already liked this song"
            });
        }

        const insertQuery = `INSERT INTO liked_song (user_id, song_id) VALUES ($1, $2)`;

        // Execute the query to insert the liked song
        await db.query(insertQuery, [user_id, song_id]);

        // const updateQuery = `UPDATE song SET popularity = LEAST(popularity + 1, 10) WHERE song_id = $1`;
        // await db.query(updateQuery, [song_id]);

        // Send response indicating successful addition
        res.status(200).json({
            status: "success",
            message: `Song '${song_id}' added to liked songs for user '${user_id}'`
        });
    } catch (err) {
        console.error(err); // Log the error for debugging
        res.status(500).json({
            status: "error",
            message: "Internal Server Error" // Generic error message
        });
    }
});
router.post("/artist", async (req, res) => {
    try {
        const { user_id, artist_id } = req.body;

        // Validate required fields
        if (!user_id || !artist_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Artist ID are required"
            });
        }
        const checkQuery = `SELECT * FROM liked_artist WHERE user_id = $1 AND artist_id = $2`;
        const checkResult = await db.query(checkQuery, [user_id, artist_id]);

        if (checkResult.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "User has already liked this artist"
            });
        }

        // Construct the SQL query to insert the liked artist
        const query = `INSERT INTO liked_artist (user_id, artist_id) VALUES ($1, $2)`;

        // Execute the query to insert the liked artist
        await db.query(query, [user_id, artist_id]);

        // Send response indicating successful addition
        res.status(200).json({
            status: "success",
            message: `Artist '${artist_id}' added to liked artists for user '${user_id}'`
        });
    } catch (err) {
        console.error(err); // Log the error for debugging
        res.status(500).json({
            status: "error",
            message: "Internal Server Error" // Generic error message
        });
    }
});
router.post("/album", async (req, res) => {
    try {
        const { user_id, album_id } = req.body;

        // Validate required fields
        if (!user_id || !album_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Album ID are required"
            });
        }
        const checkQuery = `SELECT * FROM liked_album WHERE user_id = $1 AND album_id = $2`;
        const checkResult = await db.query(checkQuery, [user_id, album_id]);

        if (checkResult.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "User has already liked this album"
            });
        }
        // Construct the SQL query to insert the liked album
        const query = `INSERT INTO liked_album (user_id, album_id) VALUES ($1, $2)`;

        // Execute the query to insert the liked album
        await db.query(query, [user_id, album_id]);

        // Send response indicating successful addition
        res.status(200).json({
            status: "success",
            message: `Album '${album_id}' added to liked albums for user '${user_id}'`
        });
    } catch (err) {
        console.error(err); // Log the error for debugging
        res.status(500).json({
            status: "error",
            message: "Internal Server Error" // Generic error message
        });
    }
});
router.post("/genre", async (req, res) => {
    try {
        const { user_id, genre_id } = req.body;

        // Validate required fields
        if (!user_id || !genre_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Genre ID are required"
            });
        }

        // Check if the user has already liked the genre
        const checkQuery = `SELECT * FROM liked_genre WHERE user_id = $1 AND genre_id = $2`;
        const checkResult = await db.query(checkQuery, [user_id, genre_id]);

        if (checkResult.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "User has already liked this genre"
            });
        }

        // Construct the SQL query to insert the liked genre
        const query = `INSERT INTO liked_genre (user_id, genre_id) VALUES ($1, $2)`;

        // Execute the query to insert the liked genre
        await db.query(query, [user_id, genre_id]);

        // Send response indicating successful addition
        res.status(200).json({
            status: "success",
            message: `Genre '${genre_id}' added to liked genres for user '${user_id}'`
        });
    } catch (err) {
        console.error(err); // Log the error for debugging
        res.status(500).json({
            status: "error",
            message: "Internal Server Error" // Generic error message
        });
    }
});


router.delete("/song", async (req, res) => {
    try {
        const { user_id, song_id } = req.body;
        if (!user_id || !song_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Song ID are required"
            });
        }
        const songQuery = `SELECT * FROM liked_song WHERE user_id = $1 AND song_id = $2`;
        const songResult = await db.query(songQuery, [user_id, song_id]);
        if (songResult.rows.length === 0) {
            return res.status(400).json({
                status: "error",
                message: "User has not liked this song"
            });
        }

        const deleteQuery = `DELETE FROM liked_song WHERE user_id = $1 AND song_id = $2`;
        await db.query(deleteQuery, [user_id, song_id]);
        res.status(200).json({
            status: "success",
            message: `Song '${song_id}' removed from liked songs for user '${user_id}'`
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
})
router.delete("/artist", async (req, res) => {
    try {
        const { user_id, artist_id } = req.body;
        if (!user_id || !artist_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Artist ID are required"
            });
        }
        const deleteQuery = `DELETE FROM liked_artist WHERE user_id = $1 AND artist_id = $2`;
        await db.query(deleteQuery, [user_id, artist_id]);
        res.status(200).json({
            status: "success",
            message: `Artist '${artist_id}' removed from liked artists for user '${user_id}'`
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
})
router.delete("/album", async (req, res) => {
    try {
        const { user_id, album_id } = req.body;
        if (!user_id || !album_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Album ID are required"
            });
        }
        const deleteQuery = `DELETE FROM liked_album WHERE user_id = $1 AND album_id = $2`;
        await db.query(deleteQuery, [user_id, album_id]);
        res.status(200).json({
            status: "success",
            message: `Album '${album_id}' removed from liked albums for user '${user_id}'`
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
})
router.delete("/genre", async (req, res) => {
    try {
        const { user_id, genre_id } = req.body;
        if (!user_id || !genre_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Genre ID are required"
            });
        }
        const deleteQuery = `DELETE FROM liked_genre WHERE user_id = $1 AND genre_id = $2`;
        await db.query(deleteQuery, [user_id, genre_id]);
        res.status(200).json({
            status: "success",
            message: `Genre '${genre_id}' removed from liked genres for user '${user_id}'`
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
})

router.post("/review", async (req, res) => {
    try {
        const { user_id, song_id, review_text, rating } = req.body;
        if (!user_id || !song_id ||  !rating) {
            return res.status(400).json({
                status: "error",
                message: "User ID, Song ID, Review Text, and Rating are required"
            });
        }
        if (rating > 10) {
            return res.status(400).json({
                status: "error",
                message: "Rating cannot be greater than 10"
            });
        }
        
        // Check if the review already exists for the user and song
        const checkQuery = `SELECT * FROM reviews WHERE user_id = $1 AND song_id = $2`;
        const checkResult = await db.query(checkQuery, [user_id, song_id]);
        
        if (checkResult.rows.length > 0) {
            // If the review already exists, update it
            const updateQuery = `
                UPDATE reviews
                SET review_text = $1, rating = $2, review_date = $3
                WHERE user_id = $4 AND song_id = $5
            `;
            await db.query(updateQuery, [review_text, rating, new Date(), user_id, song_id]);
        } else {
            // If the review doesn't exist, insert a new one
            const insertQuery = `
                INSERT INTO reviews (user_id, song_id, review_text, rating, review_date)
                VALUES ($1, $2, $3, $4, $5)
            `;
            await db.query(insertQuery, [user_id, song_id, review_text, rating, new Date()]);
        }
        
        res.status(200).json({
            status: "success",
            message: `Review added successfully`
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