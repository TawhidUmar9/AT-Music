const express = require("express");
const router = express.Router();
const db = require('../db');
const { route } = require("./songs");

const reviewRoute = require('./review');
const likeRouter = require('./like');
const unlikeRouter = require('./unlike');
const playlistRoute = require('./playlist');
const newsRoute = require('./user_news_handler');
const purchaseRoute = require('./purchase');
const friendRoute = require('./friend_handler');
const profileRoute = require('./profile');
const profileUpdateRoute = require('./user_update_handler');
const friendSuggestionRout = require('./friend_suggestion_handler');
const friendListRoute = require('./friend_list');


router.use('/', reviewRoute);
router.use('/', likeRouter);
router.use('/', unlikeRouter);
router.use('/', playlistRoute);
router.use('/', newsRoute);
router.use('/', purchaseRoute);
router.use('/', friendRoute);
router.use('/', profileRoute);
router.use('/', profileUpdateRoute);
router.use('/', friendSuggestionRout);
router.use('/', friendListRoute);


//get liked entities
router.get("/like", async (req, res) => {
    try {
        const { user_id } = req.query;
        if (!user_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID and Song ID are required"
            });
        }
        const query = `
        SELECT
        S.song_id AS song_id,
        S.name AS song_name,
        S.song_length AS song_length,
        S.album_id,
        S.age_rating,
        S.popularity,
        S.price,
        S.genre_id,
        S.artist_id,
        A.artist_name AS artist_name,
        A.artist_image AS artist_image,
        A.artist_intro_video AS artist_intro_video,
        AL.album_id AS album_id,
        AL.album_name AS album_name,
        AL.album_year,
        G.genre_name AS genre_name,
        PS.platform_id AS platform_id,
        P.platform_name AS platform_name,
        P.total_visit AS total_visits,
        RT.rectype_name AS rectype_name,
        RT.rectype_id AS rectype_id,
        SS.synopsis AS synopsis,
        P1.person_id AS composer_id,
        P1.name AS composer_name,
        P1.gender AS composer_gender,
        P1.nationality AS composer_nationality,
        P1.biography AS composer_biography,
        P2.person_id AS lyricist_id,
        P2.name AS lyricist_name,
        P2.gender AS lyricist_gender,
        P2.nationality AS lyricist_nationality,
        P2.biography AS lyricist_biography,
        P3.person_id AS producer_id,
        P3.name AS producer_name,
        P3.nationality AS producer_nationality,
        P3.gender AS producer_gender,
        P3.biography AS producer_biography
        FROM
            SONG S
        LEFT JOIN
            LIKED_SONG LS ON S.SONG_ID = LS.SONG_ID
        LEFT JOIN
            ARTIST A ON S.ARTIST_ID = A.ARTIST_ID
        LEFT JOIN
            ALBUM AL ON S.ALBUM_ID = AL.ALBUM_ID
        LEFT JOIN
            GENRE G ON S.GENRE_ID = G.GENRE_ID
        LEFT JOIN
            PLATFORM_SONG PS ON S.SONG_ID = PS.SONG_ID
    LEFT JOIN
        PLATFORM P ON PS.PLATFORM_ID = P.PLATFORM_ID
    LEFT JOIN
        RECORDING_SONG RS ON S.SONG_ID = RS.SONG_ID
    LEFT JOIN
        REC_TYPE RT ON RS.RECTYPE_ID = RT.RECTYPE_ID
    LEFT JOIN
        SONG_SYNOPSIS SS ON S.SONG_ID = SS.SONG_ID
    LEFT JOIN
        COMPOSER C ON S.SONG_ID = C.SONG_ID
    LEFT JOIN
        LYRICIST L ON S.SONG_ID = L.SONG_ID
    LEFT JOIN
        PRODUCER PR ON S.SONG_ID = PR.SONG_ID
    LEFT JOIN
        PEOPLE P1 ON C.COMPOSER_ID = P1.PERSON_ID
    LEFT JOIN
        PEOPLE P2 ON L.LYRICIST_ID = P2.PERSON_ID
    LEFT JOIN
        PEOPLE P3 ON PR.PRODUCER_ID = P3.PERSON_ID
    WHERE
        LS.USER_ID = $1
    GROUP BY
        S.song_id, S.name, S.song_length, S.album_id, S.age_rating, S.popularity, S.price, S.genre_id, S.artist_id,
        A.artist_name, A.artist_image, A.artist_intro_video, AL.album_id, AL.album_name, AL.album_year,
        G.genre_name, PS.platform_id, P.platform_name, P.total_visit, RT.rectype_name, RT.rectype_id, SS.synopsis,
        P1.person_id, P1.name, P1.gender, P1.nationality, P1.biography, P2.person_id, P2.name, P2.gender,
        P2.nationality, P2.biography, P3.person_id, P3.name, P3.nationality, P3.gender, P3.biography
    HAVING COUNT(*) = 1;`;
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

//user can delete account which will initiate cascade.
router.delete("/delete", async (req, res) => {
    try {
        const { user_id } = req.body;
        if (!user_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID is required"
            });
        }
        const query = `
        DELETE FROM user_db
        WHERE user_id = $1`;
        await db.query(query, [user_id]);
        res.status(200).json({
            status: "success",
            data: {
                message: "Account deleted successfully"
            }
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