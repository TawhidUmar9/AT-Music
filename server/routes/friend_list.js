const express = require("express");
const router = express.Router();
const db = require('../db');

//get friend request list.
router.get("/friendrequest", async (req, res) => {
    try {
        const { user_id } = req.query;
        if (!user_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID is required"
            });
        }
        const query = `
        SELECT * from user_db
        join friend_request on user_db.user_id = friend_request.sender
        WHERE friend_request.recipient = $1`;
        const result = await db.query(query, [user_id]);
        res.status(200).json({
            status: "success",
            data: {
                friends: result.rows
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
//existing friends.
router.get("/friends", async (req, res) => {
    try {
        const { user_id } = req.query;
        if (!user_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID is required"
            });
        }
        const query = `
        SELECT * from user_db
        JOIN friends ON user_db.user_id = friends.user2
        WHERE friends.user1 = $1`;
        const result = await db.query(query, [user_id]);
        res.status(200).json({
            status: "success",
            data: {
                friends: result.rows
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
//sent friend request.
router.get("/sentrequest", async (req, res) => {
    try {
        const { user_id } = req.query;
        if (!user_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID is required"
            });
        }
        const query = `
        SELECT * from user_db
        JOIN friend_request ON user_db.user_id = friend_request.recipient
        WHERE friend_request.sender = $1`;
        const result = await db.query(query, [user_id]);
        res.status(200).json({
            status: "success",
            data: {
                friends: result.rows
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