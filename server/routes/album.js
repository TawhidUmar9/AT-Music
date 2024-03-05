const express = require("express");
const router = express.Router();
const db = require('../db');

//get all albums
router.get("/", async (req, res) => {
    try {
        const query = `SELECT * FROM album
        left join artist on album.artist_id = artist.artist_id
        left join song on album.album_id = song.album_id`;
        const result = await db.query(query);
        res.status(200).json({
            status: "success",
            data: result.rows
        });
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});

//get album by album name
router.get("/:albumName", async (req, res) => {
    try {
        const albumName = req.params.albumName;
        const {user_id} = req.query;
        const query = `SELECT * FROM album
        left join artist on album.artist_id = artist.artist_id
        left join song on album.album_id = song.album_id
        WHERE album_name = $1`;

        const albumLikedQuery = `
            SELECT * FROM liked_album
            WHERE album_id = $1
            and user_id= $2;`;

        const result = await db.query(query, [albumName]);
        const albumLikedResult = await db.query(albumLikedQuery, [result.rows[0].album_id, user_id]);
        res.status(200).json({
            status: "success",
            data: result.rows,
            isLiked: albumLikedResult.rows.length > 0
        });
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});

module.exports = router;