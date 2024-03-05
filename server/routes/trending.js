const express = require("express");
const router = express.Router();
const db = require('../db');

router.get("/", async (req, res) => {
    try {
        const nDaysAgo = new Date();
        nDaysAgo.setDate(nDaysAgo.getDate() - req.query.n); // Assuming 'n' is passed as a query parameter

        const trendingQuery = `
        SELECT s.song_id,
        s.name AS song_name,
        a.artist_id,
        a.artist_name AS artist_name,
        al.album_id,
        al.album_name AS album_name,
        g.genre_id,
        g.genre_name AS genre_name,
        s.popularity,
        COUNT(DISTINCT r.review_id) AS review_count,
        COUNT(DISTINCT ph.purchase_id) AS purchase_count
        FROM song s
        LEFT JOIN artist a ON s.artist_id = a.artist_id
        LEFT JOIN album al ON s.album_id = al.album_id
        LEFT JOIN genre g ON s.genre_id = g.genre_id
        LEFT JOIN reviews r ON s.song_id = r.song_id
        LEFT JOIN purchase_history ph ON s.song_id = ph.song_id
        WHERE s.song_id IN (
            SELECT s1.song_id
            FROM (
                SELECT song.song_id
                FROM song
                LEFT JOIN reviews ON song.song_id = reviews.song_id
                WHERE review_date >= $1
                GROUP BY song.song_id
                ORDER BY COUNT(reviews.review_id) DESC
                LIMIT 10
            ) AS s1
        )
        OR s.song_id IN (
            SELECT s2.song_id
            FROM (
                SELECT song.song_id
                FROM song
                LEFT JOIN purchase_history ON song.song_id = purchase_history.song_id
                GROUP BY song.song_id
                ORDER BY COUNT(purchase_history.purchase_id) DESC
                LIMIT 10
            ) AS s2
        )
        GROUP BY s.song_id, s.name, a.artist_id, a.artist_name,
            al.album_id, al.album_name, g.genre_id, g.genre_name,s.popularity
        ORDER BY s.song_id DESC;`;

        const { rows } = await db.query(trendingQuery, [nDaysAgo]);
        res.status(200).json({
            trendingSongs: rows
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({ msg: "Server Error" });
    }
});

module.exports = router;
