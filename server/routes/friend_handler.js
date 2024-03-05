const express = require("express");
const router = express.Router();
const db = require('../db');


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
            WHERE (sender = $1 AND recipient = $2) OR (sender = $2 AND recipient = $1)`;
        const checkFriendRequestResult =
            await db.query(checkFriendRequestQuery, [sender_id, recipient_id]);
        if (checkFriendRequestResult.rows.length > 0) {
            return res.status(403).json({
                status: "error",
                message: "Friend request already exists"
            });
        }
        //check if they are already friends
        const checkFriendQuery = `
            SELECT * FROM friends
            WHERE (user1 = $1 AND user2 = $2) OR (user1 = $2 AND user2 = $1)`;
        const checkFriendResult = await db.query(checkFriendQuery, [sender_id, recipient_id]);
        if (checkFriendResult.rows.length > 0) {
            return res.status(403).json({
                status: "error",
                message: "You are already friends"
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
//cancel friend request.
router.delete("/cancel", async (req, res) => {
    try {
        //sender_id te self user_id
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
                message: "Friend request cancelled successfully"
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




module.exports = router;