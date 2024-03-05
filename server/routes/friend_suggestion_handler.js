const express = require("express");
const router = express.Router();
const db = require('../db');

//get suggestions
router.get("/suggestions", async (req, res) => {
    try {
        const { user_id } = req.query;

        if (!user_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID is required"
            });
        }
        const suggestionsQuery = `
            SELECT * FROM user_db ud
            WHERE (ud.user_id IN (
                    SELECT user_id FROM liked_song
                    WHERE song_id IN (
                        SELECT song_id FROM liked_song
                        WHERE user_id = $1
                    )
                )
                OR ud.user_id IN (
                    SELECT user_id FROM liked_artist
                    WHERE artist_id IN (
                        SELECT artist_id FROM liked_artist
                    WHERE user_id = $1
                    )
                )
            )
            AND ud.user_id NOT IN (
                SELECT user1 FROM friends
                WHERE user2 = $1 
                UNION
                SELECT user2 FROM friends
                WHERE user1 = $1
            )
            AND ud.user_id NOT IN (
                SELECT sender FROM friend_request
                WHERE recipient = $1
            )
            AND ud.user_id NOT IN (
                SELECT recipient FROM friend_request
                WHERE sender = $1
            )
            AND ud.user_id != $1`;
        const suggestionsResult = await db.query(suggestionsQuery, [user_id]);

        res.status(200).json({
            status: "success",
            results: suggestionsResult.rows.length,
            data: {
                suggestions: suggestionsResult.rows
            }
        });

    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "An internal server error occurred"
        });
    }
});



module.exports = router;