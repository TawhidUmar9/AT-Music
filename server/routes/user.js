const express = require("express");
const router = express.Router();
const db = require('../db');
const { route } = require("./songs");

const reviewRoute = require('./review');
const likeRouter = require('./like');
const unlikeRouter = require('./unlike');
const playlistRoute = require('./playlist');
const newsRoute = require('./user_news_handler');


router.use('/', reviewRoute);
router.use('/', likeRouter);
router.use('/', unlikeRouter);
router.use('/', playlistRoute);
router.use('/', newsRoute);


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