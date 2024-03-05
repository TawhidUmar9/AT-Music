const express = require("express");
const router = express.Router();
const db = require('../db');


//get all genres
router.get("/", async (req, res) => {
    try {
        const query = `SELECT * FROM genre`;
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
//get genre details and song details by genre name and whether is liked.
router.get("/:genreName", async (req, res) => {
    try {
        const genreName = req.params.genreName;
        const { user_id } = req.query;

        const query = `SELECT * FROM genre WHERE lower(genre_name) = lower($1)`;
        const genreResult = await db.query(query, [genreName]);

        const songsInGenreQuery = `SELECT * FROM genre
            left join song on genre.genre_id = song.genre_id
            left join artist on song.artist_id = artist.artist_id
            left join album on album.album_id = song.album_id
            WHERE lower(genre_name) = lower($1)`;
        const songInGenreResult = await db.query(songsInGenreQuery, [genreName]);

        const genreLikedQuery = `SELECT * FROM liked_genre
            WHERE genre_id = $1
            and user_id= $2;`;
        const genreLikedResult =
            await db.query(genreLikedQuery, [genreResult.rows[0].genre_id, user_id]);

        res.status(200).json({
            status: "success",
            data: genreResult.rows,
            songs: songInGenreResult.rows,
            isLiked: genreLikedResult.rows.length > 0
        });


    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }

});


module.exports = router;