const express = require("express");
const router = express.Router();
const db = require('../db');

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
router.post("/add/", async (req, res) => {
    try {
        const { user_id, playlist_name, song_id } = req.body;
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
router.post("/add/playlist/", async (req, res) => {
    try {
        const { song_id, playlist_name } = req.body;;

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

//get all playlist of user.
router.get("/playlist", async (req, res) => {
    try {
        const { user_id } = req.query
        const playlistQuery = `
            SELECT * FROM user_playlist
            WHERE user_id = ${user_id}`;
        const playlistResult = await db.query(playlistQuery);
        res.status(200).json({
            status: "success",
            data: playlistResult.rows
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
})

//get all songs of playlist
router.get("/playlist/songs", async (req, res) => {
    try {
        const { playlist_id } = req.query
        const playlistSongQuery = `
            select * from playlist p
            left join song s on p.song_id = s.song_id
            left join artist a on s.artist_id = a.artist_id
            left join album al on s.album_id = al.album_id
            left join genre g on s.genre_id = g.genre_id
            where p.playlist_id = ${playlist_id}`;
        const playlistSongResult = await db.query(playlistSongQuery);
        res.status(200).json({
            status: "success",
            data: playlistSongResult.rows
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }

})


module.exports = router;