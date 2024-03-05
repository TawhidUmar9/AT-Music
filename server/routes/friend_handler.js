const express = require("express");
const router = express.Router();
const db = require('../db');

//get suggestions
router.get("/suggestions", async (req, res) => {
    try {
        const { user_id } = req.query;

        // Validate user_id
        if (!user_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID is required"
            });
        }

        // Fetch song suggestions for the user
        const suggestionsQuery = `
            SELECT ud.user_id, ud.username,'song' as category 
            FROM liked_song ls
            JOIN user_db ud ON ls.user_id = ud.user_id
            WHERE ls.song_id IN 
                (SELECT ls1.song_id FROM liked_song ls1 WHERE ls1.user_id = $1)
            AND
                ls.user_id != $1
            GROUP BY ud.user_id, ud.username
            
            UNION(
                SELECT ud.user_id, ud.username,'artist' as category
                FROM liked_artist la
                JOIN user_db ud ON la.user_id = ud.user_id
                WHERE la.artist_id IN 
                    (SELECT la1.artist_id FROM liked_artist la1 WHERE la1.user_id = $1)
                AND
                    la.user_id != $1
                GROUP BY ud.user_id, ud.username
            )
            `;

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
//add friend
router.post("/addfriend", async (req, res) => {
    try {
        const { status, sender_id, recipient_id } = req.body;

        // Validate inputs
        if (typeof status !== 'boolean' || !sender_id || !recipient_id) {
            return res.status(400).json({
                status: "error",
                message: "Invalid input data"
            });
        } else if (sender_id === recipient_id) {
            return res.status(400).json({
                status: "error",
                message: "You cannot send a friend request to yourself"
            });
        }
        // Check if friend request already exists
        const checkFriendRequestQuery = `
            SELECT * FROM friend_request
            WHERE sender = $1 AND recipient = $2`;
        const checkFriendRequestResult =
            await db.query(checkFriendRequestQuery, [sender_id, recipient_id]);
        if (checkFriendRequestResult.rows.length > 0) {
            return res.status(403).json({
                status: "error",
                message: "Friend request already exists"
            });
        }
        // Insert friend request if status is false
        if (!status) {
            const addFriendQuery = `
                INSERT INTO friend_request (sender, recipient, request_sent)
                VALUES ($1, $2, $3)`;
            await db.query(addFriendQuery, [sender_id, recipient_id, new Date()]);
        }

        // Respond with success message
        res.status(200).json({
            status: "success",
            data: {
                message: "Friend request sent successfully"
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
//accept friend request.
router.post("/acceptfriend", async (req, res) => {
    try {
        const { sender_id, recipient_id } = req.body;
        if (!sender_id || !recipient_id) {
            return res.status(400).json({
                status: "error",
                message: "Invalid input data"
            });
        }
        //check if friend request exists
        const checkFriendRequestQuery = `
            SELECT * FROM friend_request
            WHERE sender = $1 AND recipient = $2`;
        const checkFriendRequestResult =
            await db.query(checkFriendRequestQuery, [sender_id, recipient_id]);
        if (checkFriendRequestResult.rows.length === 0) {
            return res.status(404).json({
                status: "error",
                message: "Friend request not found"
            });
        }
        //delete friend request
        const deleteFriendRequestQuery = `
            DELETE FROM friend_request
            WHERE sender = $1 AND recipient = $2`;
        await db.query(deleteFriendRequestQuery, [sender_id, recipient_id]);

        const acceptFriendQuery = `
            INSERT INTO friends(user1, user2, date_connected)
                values($1, $2, $3)`;
        await db.query(acceptFriendQuery, [sender_id, recipient_id, new Date()]);
        await db.query(acceptFriendQuery, [recipient_id, sender_id, new Date()]);
        // Respond with success message
        res.status(200).json({
            status: "success",
            data: {
                message: "Friend request accepted successfully"
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
//reject friend request.
router.delete("/rejectfriend", async (req, res) => {
    try {
        const { sender_id, recipient_id } = req.body;
        if (!sender_id || !recipient_id) {
            return res.status(400).json({
                status: "error",
                message: "Invalid input data"
            });
        }
        //check if friend request exists
        const checkFriendRequestQuery = `
            SELECT * FROM friend_request
            WHERE sender = $1 AND recipient = $2`;
        const checkFriendRequestResult =
            await db.query(checkFriendRequestQuery, [sender_id, recipient_id]);
        if (checkFriendRequestResult.rows.length === 0) {
            return res.status(404).json({
                status: "error",
                message: "Friend request not found"
            });
        }
        //delete friend request
        const deleteFriendRequestQuery = `
            DELETE FROM friend_request
            WHERE sender = $1 AND recipient = $2`;
        await db.query(deleteFriendRequestQuery, [sender_id, recipient_id]);

        // Respond with success message
        res.status(200).json({
            status: "success",
            data: {
                message: "Friend request rejected successfully"
            }
        });

    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "An internal server error occurred"
        });
    }
})

//get friend request list.

module.exports = router;