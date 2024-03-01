const express = require("express");
const router = express.Router();
const db = require('../db');
const { route } = require("./songs");


const reviewRoute = require('./review');
router.use('/', reviewRoute);

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

//unliking the entities
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

//creating new playlist
router.post("/create", async (req, res) => {
    try {
        const { user_id, playlist_name } = req.body;
        if (!user_id || !playlist_name) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Playlist Name are required"
            });
        }

        // Check if the playlist already exists for the user
        const playlistCheckQuery = `
            SELECT playlist_id 
            FROM user_playlist 
            WHERE user_id = $1 
                AND LOWER(playlist_name) = LOWER($2)`;

        const playlistCheckResult = await db.query(playlistCheckQuery, [user_id, playlist_name]);

        if (playlistCheckResult.rows.length === 0) {
            // If playlist doesn't exist, insert it into the user_playlist table
            const insertPlaylistQuery = `
                INSERT INTO user_playlist (user_id, playlist_name) 
                VALUES ($1, $2) RETURNING playlist_id`;
            const insertPlaylistResult = await db.query(insertPlaylistQuery, [user_id, playlist_name]);

            res.status(200).json({
                status: "success",
                message: "Playlist Created"
            });
        } else {
            res.status(400).json({
                status: "error",
                message: "Playlist already exists for the user"
            });
        }

    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
});

//creating new playlist and adding the song.
router.post("/add/:song_id", async (req, res) => {
    try {
        song_id = req.params.song_id;
        const { user_id, playlist_name } = req.body;
        if (!user_id || !playlist_name) {
            return res.status(400).json({
                status: "error",
                message: "User ID, Song ID, and Playlist Name are required"
            });
        }

        // Check if the playlist already exists for the user
        const playlistCheckQuery = `
            SELECT playlist_id 
            FROM user_playlist 
            WHERE user_id = $1 
                AND LOWER(playlist_name) = LOWER($2)`;

        const playlistCheckResult = await db.query(playlistCheckQuery, [user_id, playlist_name]);

        let playlistId;

        if (playlistCheckResult.rows.length === 0) {
            // If playlist doesn't exist, insert it into the user_playlist table
            const insertPlaylistQuery = `
                INSERT INTO user_playlist (user_id, playlist_name) 
                VALUES ($1, $2) RETURNING playlist_id`;
            const insertPlaylistResult = await db.query(insertPlaylistQuery, [user_id, playlist_name]);
            playlistId = insertPlaylistResult.rows[0].playlist_id;
        } else {
            playlistId = playlistCheckResult.rows[0].playlist_id;
        }

        // Check if the song already exists in the playlist
        const songCheckQuery = `
            SELECT *
            FROM playlist
            WHERE playlist_id = $1
            AND song_id = $2`;

        const songCheckResult = await db.query(songCheckQuery, [playlistId, song_id]);

        if (songCheckResult.rows.length === 0) {
            // Insert the song into the playlist table only if it doesn't already exist
            const insertSongQuery = `
                INSERT INTO playlist (playlist_id, song_id) 
                VALUES ($1, $2)`;
            await db.query(insertSongQuery, [playlistId, song_id]);

            res.status(200).json({
                status: "success",
                message: "Song added to playlist successfully"
            });
        } else {
            res.status(400).json({
                status: "error",
                message: "Song already exists in the playlist"
            });
        }

    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
});
//adds song to existing playlist
router.post("/add/playlist/:playlist_name", async (req, res) => {
    try {
        const { song_id } = req.body;
        const playlist_name = req.params.playlist_name;

        if (!song_id) {
            return res.status(400).json({
                status: "error",
                message: "Song ID are required"
            });
        }

        // Check if the playlist already exists for the user
        const playlistCheckQuery = `
            SELECT playlist_id 
            FROM user_playlist 
            WHERE LOWER(playlist_name) = LOWER($1)`;

        const playlistCheckResult = await db.query(playlistCheckQuery, [playlist_name]);

        if (playlistCheckResult.rows.length === 0) {
            return res.status(404).json({
                status: "error",
                message: "Playlist not found"
            });
        }

        const playlistId = playlistCheckResult.rows[0].playlist_id;

        // Check if the song already exists in the playlist
        const songCheckQuery = `
            SELECT *
            FROM playlist
            WHERE playlist_id = $1
            AND song_id = $2`;

        const songCheckResult = await db.query(songCheckQuery, [playlistId, song_id]);

        if (songCheckResult.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "Song already exists in the playlist"
            });
        }

        // Insert the song into the playlist table
        const insertSongQuery = `
            INSERT INTO playlist (playlist_id, song_id) 
            VALUES ($1, $2)`;
        await db.query(insertSongQuery, [playlistId, song_id]);

        res.status(200).json({
            status: "success",
            message: "Song added to playlist successfully"
        });

    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
});
//get liked entities
router.get("/like", async (req, res) => {
    try {
        const { user_id } = req.body;
        if (!user_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Song ID are required"
            });
        }
        const query = `
        SELECT * 
        FROM liked_song L
        JOIN SONG S ON S.SONG_ID = L.SONG_ID
        WHERE user_id = $1`;
        const liked_song = await db.query(query, [user_id]);

        const query2 = `
        SELECT * 
        FROM liked_artist L
        JOIN ARTIST A ON A.ARTIST_ID = L.ARTIST_ID
        WHERE user_id = $1`;
        const liked_artist = await db.query(query2, [user_id]);

        const query3 = `
        SELECT * 
        FROM liked_album L
        JOIN ALBUM AL ON AL.ALBUM_ID = L.ALBUM_ID
        WHERE user_id = $1`;
        const liked_album = await db.query(query3, [user_id]);

        const query4 = `
        SELECT * 
        FROM liked_genre L
        JOIN GENRE G ON G.GENRE_ID = L.GENRE_ID
        WHERE user_id = $1`;
        const liked_genre = await db.query(query4, [user_id]);

        res.status(200).json({
            status: "success",
            liked_song: liked_song.rows,
            liked_artist: liked_artist.rows,
            liked_album: liked_album.rows,
            liked_genre: liked_genre.rows
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