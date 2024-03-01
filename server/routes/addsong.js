const express = require("express");
const router = express.Router();
const db = require('../db');


//add song
router.post("/song", async (req, res) => {
    try {
        const { song_name, artist_name, album_name, album_year, composer_name,
            composer_biography, composer_gender, composer_nationality,
            lyricist_name, lyricist_biography, lyricist_gender, lyricist_nationality,
            producer_biography, producer_gender, producer_nationality,
            age_rating, genre_name, price, popularity = 0, producer_name, synopsis,
            recording_type, platform_type, song_length,
        } = req.body;
        if (!song_name || !artist_name || !album_name || !age_rating || !genre_name || !price
            || !recording_type || !platform_type || !song_length) {
            return res.status(400).json({
                status: "error",
                message: "Song name, artist name, " +
                    "album name, age rating, genre name, and price are required"
            });
        }

        const songCheckQuery = `SELECT * FROM song WHERE LOWER(name) = LOWER($1)`;
        const songCheckResult = await db.query(songCheckQuery, [song_name]);

        if (songCheckResult.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "Song already exists"
            });
        }

        // Find artist_id from artist table
        const artistQuery = `SELECT artist_id FROM artist WHERE LOWER(artist_name) = LOWER($1)`;
        const artistResult = await db.query(artistQuery, [artist_name]);
        // Check if artist exists
        if (artistResult.rows.length === 0) {
            return res.status(404).json({
                status: "error",
                message: "Artist not found"
            });
        }
        const artist_id = artistResult.rows[0].artist_id;

        // Find album_id from album table
        const albumQuery = `SELECT album_id FROM album WHERE LOWER(album_name) = LOWER($1)`;
        const albumResult = await db.query(albumQuery, [album_name]);
        // Check if album exists
        if (albumResult.rows.length === 0) {
            //create new album
            const albumInsertQuery = `INSERT INTO album (album_name, artist_id, album_year) 
                            VALUES ($1, $2, $3) RETURNING *`;
            const albumInsertResult = await db.query(albumInsertQuery, [album_name, artist_id, album_year]);
        }
        const albumResult2 = await db.query(albumQuery, [album_name]);
        const album_id = albumResult2.rows[0].album_id;

        // Find genre_id from genre table
        const genreQuery = `SELECT genre_id FROM genre WHERE LOWER(genre_name) = LOWER($1)`;
        const genreResult = await db.query(genreQuery, [genre_name]);
        // Check if genre exists
        if (genreResult.rows.length === 0) {
            return res.status(404).json({
                status: "error",
                message: "Genre not found"
            });
        }
        const genre_id = genreResult.rows[0].genre_id;

        // Find platform_id from platform table
        const platformQuery = `SELECT platform_id FROM
                    platform WHERE LOWER(platform_name) = LOWER($1)`;
        const platformResult = await db.query(platformQuery, [platform_type]);
        if (platformResult.rows.length === 0) {
            return res.status(404).json({
                status: "error",
                message: "Platform not found"
            });
        }
        const platform_id = platformResult.rows[0].platform_id;
        // Find recording_id from recording table
        const recordingQuery = `SELECT rectype_id FROM 
                    rec_type WHERE LOWER(rectype_name) = LOWER($1)`;
        const recordingResult = await db.query(recordingQuery, [recording_type]);
        // Check if recording exists
        if (recordingResult.rows.length === 0) {
            return res.status(404).json({
                status: "error",
                message: "Recording not found"
            });
        }
        const recording_id = recordingResult.rows[0].rectype_id;
        console.log(recording_id, recording_type);
        // Insert the song into the database
        const query = `INSERT INTO song (artist_id, name, album_id, song_length,
                        age_rating, genre_id, price) 
                       VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *`;

        const result = await db.query(query, [artist_id, song_name, album_id, song_length,
            age_rating, genre_id, price]);

        const songQuery = `SELECT song_id FROM song WHERE LOWER(name) = LOWER($1)`;
        const songResult = await db.query(songQuery, [song_name]);
        const song_id = songResult.rows[0].song_id;

        // Insert the song synopsis into the database
        const songSynopsisQuery = `INSERT INTO song_synopsis (song_id, synopsis)
                                    VALUES ($1, $2)`;
        await db.query(songSynopsisQuery, [song_id, synopsis]);

        // Find composer_id from people table
        const composerQuery = `SELECT person_id FROM people WHERE LOWER(name) = LOWER($1)`;
        const composerResult = await db.query(composerQuery, [composer_name]);
        let composer_id;
        if (composerResult.rows.length === 0) {
            // Insert the composer into the database
            const composerInsertQuery = `INSERT INTO people (name, nationality, gender, biography)
                                 VALUES ($1, $2, $3, $4) RETURNING person_id`;
            const composerInsertResult = await db.query(composerInsertQuery, [composer_name, composer_nationality, composer_gender, composer_biography]);
            composer_id = composerInsertResult.rows[0].person_id;
        } else {
            composer_id = composerResult.rows[0].person_id;
        }
        // Insert composer_id and song_id into composer table
        const composerSongQuery = `INSERT INTO composer (composer_id, song_id)
                            VALUES ($1, $2)`;
        await db.query(composerSongQuery, [composer_id, song_id]);

        // Find lyricist_id from people table
        const lyricistQuery = `SELECT person_id FROM people WHERE LOWER(name) = LOWER($1)`;
        const lyricistResult = await db.query(lyricistQuery, [lyricist_name]);
        let lyricist_id;
        if (lyricistResult.rows.length === 0) {
            // Insert the lyricist into the database
            const lyricistInsertQuery = `INSERT INTO people (name, nationality, gender, biography)
                                  VALUES ($1, $2, $3, $4) RETURNING person_id`;
            const lyricistInsertResult = await db.query(lyricistInsertQuery, [lyricist_name, lyricist_nationality, lyricist_gender, lyricist_biography]);
            lyricist_id = lyricistInsertResult.rows[0].person_id;
        } else {
            lyricist_id = lyricistResult.rows[0].person_id;
        }
        // Insert lyricist_id and song_id into lyricist table
        const lyricistSongQuery = `INSERT INTO lyricist (lyricist_id, song_id)
                            VALUES ($1, $2)`;
        await db.query(lyricistSongQuery, [lyricist_id, song_id]);

        // Find producer_id from people table
        const producerQuery = `SELECT person_id FROM people WHERE LOWER(name) = LOWER($1)`;
        const producerResult = await db.query(producerQuery, [producer_name]);
        let producer_id;
        if (producerResult.rows.length === 0) {
            // Insert the producer into the database
            const producerInsertQuery = `INSERT INTO people (name, nationality, gender, biography)
                    VALUES ($1, $2, $3, $4) RETURNING person_id`;
            const producerInsertResult = await db.query(producerInsertQuery, [producer_name, producer_nationality, producer_gender, producer_biography]);
            producer_id = producerInsertResult.rows[0].person_id;
        } else {
            producer_id = producerResult.rows[0].person_id;
        }
        // Insert producer_id and song_id into producer table
        const producerSongQuery = `INSERT INTO producer (producer_id, song_id)
                            VALUES ($1, $2)`;
        await db.query(producerSongQuery, [producer_id, song_id]);


        const songPlatformQuery = `INSERT INTO platform_song (platform_id, song_id)
            VALUES ($1, $2)`;
        await db.query(songPlatformQuery, [platform_id, song_id]);
        const songRecordingQuery = `INSERT INTO recording_song (rectype_id, song_id)
                VALUES ($1, $2)`;
        console.log(recording_id, song_id);
        await db.query(songRecordingQuery, [recording_id, song_id]);

        res.status(201).json({
            status: "success",
            message: `Song '${song_name}' added successfully`,
            data: result.rows[0]
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Failed to add song"
        });
    }
});


module.exports = router;