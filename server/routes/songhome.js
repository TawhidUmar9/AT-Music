const express = require("express");
const router = express.Router();
const db = require('../db');

router.get("/:song_id", async (req, res) => {
    try {
        const song_id = req.params.song_id;
        const { user_id } = req.query;
        console.log(user_id);

        const query = `SELECT 
            S.song_id AS song_id,
            S.name AS song_name,
            S.song_length AS song_length,
            S.album_id, S.age_rating, S.popularity, S.price, S.genre_id, S.artist_id,
            A.artist_name AS artist_name,
            AL.album_id AS album_id,
            AL.album_name AS album_name,
            AL.album_year,G.genre_name,
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
            FROM SONG S
            LEFT JOIN ARTIST A ON S.ARTIST_ID = A.ARTIST_ID
            LEFT JOIN ALBUM AL ON S.ALBUM_ID = AL.ALBUM_ID
            LEFT JOIN GENRE G ON S.GENRE_ID = G.GENRE_ID
            LEFT JOIN PLATFORM_SONG PS ON S.SONG_ID = PS.SONG_ID
            LEFT JOIN PLATFORM P ON PS.PLATFORM_ID = P.PLATFORM_ID
            LEFT JOIN RECORDING_SONG RS ON S.SONG_ID = RS.SONG_ID
            LEFT JOIN REC_TYPE RT ON RS.RECTYPE_ID = RT.RECTYPE_ID
            LEFT JOIN SONG_SYNOPSIS SS ON S.SONG_ID = SS.SONG_ID
            LEFT JOIN COMPOSER C ON S.SONG_ID = C.SONG_ID
            LEFT JOIN LYRICIST L ON S.SONG_ID = L.SONG_ID
            LEFT JOIN PRODUCER PR ON S.SONG_ID = PR.SONG_ID
            LEFT JOIN PEOPLE P1 ON C.COMPOSER_ID = P1.PERSON_ID
            LEFT JOIN PEOPLE P2 ON L.LYRICIST_ID = P2.PERSON_ID
            LEFT JOIN PEOPLE P3 ON PR.PRODUCER_ID = P3.PERSON_ID
            WHERE S.song_id = $1;`;

        //check if user liked the song

        const presentLikeQuery = `
            SELECT * 
            FROM liked_song 
            WHERE user_id = $1 AND song_id = $2`;
        const likedSong = await db.query(presentLikeQuery, [user_id, song_id]);

        const userPlaylist = `
            SELECT *
            FROM USER_PLAYLIST
            WHERE USER_ID = $1`;
        const userPlaylistResult = await db.query(userPlaylist, [user_id]);

        // Handle undefined variables if necessary

        const result = await db.query(query, [song_id]);
        res.status(200).json({
            status: "success",
            data: result.rows[0],
            songIsLiked: likedSong.rows.length > 0,
            userPlayList: userPlaylistResult.rows
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