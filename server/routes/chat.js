const express = require("express");
const router = express.Router();
const db = require('../db');

// Post a chat message
router.post("/chat", async (req, res) => {
    try {
        const { sender_id, receiver_id, message } = req.body;
        if (!sender_id || !receiver_id || !message) {
            return res.status(400).json({
                status: "error",
                message: "sender_id, receiver_id, and message are required"
            });
        }

        // Insert the encrypted message into the database
        const chatInsertQuery = `
            INSERT INTO chat (sender_id, receiver_id, message, message_time) 
            VALUES ($1, $2, pgp_sym_encrypt($3, $4), $5)
            RETURNING *;
        `;

        const currentTime = new Date();
        const chatInsertResult = await db.query(chatInsertQuery, [sender_id, receiver_id, message, process.env.ENCRYPTION_PASSWORD, currentTime]);

        res.status(201).json({
            status: "success",
            data: {
            },
        });

    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
});


// Get all chats between two users
router.get("/chat/:user_id1", async (req, res) => {
    try {
        const user_id1 = req.params.user_id1;
        const user_id2 = req.query.user_id2;

        // Validate user IDs
        if (!Number.isInteger(Number(user_id1)) || !Number.isInteger(Number(user_id2))) {
            return res.status(400).json({
                status: "error",
                message: "Invalid user IDs"
            });
        }

        // Fetch and decrypt chat messages
        const chatQuery = `
            SELECT chat_id, sender_id, receiver_id, pgp_sym_decrypt(message, $3) AS message, message_time
            FROM chat
            WHERE (sender_id = $1 AND receiver_id = $2) OR (sender_id = $2 AND receiver_id = $1)
            ORDER BY message_time`;

        const chatResult = await db.query(chatQuery, [user_id1, user_id2, process.env.ENCRYPTION_PASSWORD]);
        const user_info = await db.query(`SELECT * FROM user_db WHERE user_id = $1`, [user_id1]);
        res.status(200).json({
            status: "success",
            data: {
                chats: chatResult.rows,
                user_info: user_info.rows[0]
            },
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
});

//delete a message.
router.delete("/chat/:chat_id", async (req, res) => {
    try {
        const chat_id = req.params.chat_id;
        const deleteChatQuery = `DELETE FROM chat WHERE chat_id = $1`;
        await db.query(deleteChatQuery, [chat_id]);

        res.status(200).json({
            status: "success",
            message: "Message deleted successfully"
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: "Internal Server Error"
        });
    }
});

//delete conversation
router.delete("/chat/:user_id1/:user_id2", async (req, res) => {
    try {
        const user_id1 = req.params.user_id1;
        const user_id2 = req.params.user_id2;
        const deleteChatQuery = `DELETE FROM chat WHERE (sender_id = $1 AND receiver_id = $2) OR (sender_id = $2 AND receiver_id = $1)`;
        await db.query(deleteChatQuery, [user_id1, user_id2]);

        res.status(200).json({
            status: "success",
            message: "Conversation deleted successfully"
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
