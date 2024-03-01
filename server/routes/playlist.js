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

module.exports = router;