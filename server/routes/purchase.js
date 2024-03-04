const express = require("express");
const router = express.Router();
const db = require('../db');

//add song to cart
router.post("/cart", async (req, res) => {
    try {
        const { user_id, song_id } = req.body;
        if (!user_id || !song_id) {
            return res.status(400).json({
                status: "error",
                message: "User_id and Song_id are required"
            });
        }
        const addToCartQuery = `INSERT INTO cart(user_id, song_id)
            VALUES ($1, $2) RETURNING *`
        const addToCartResult = await db.query(addToCartQuery, [user_id, song_id]);

        res.status(200).json({
            status: "success",
            data: {
                cart: addToCartResult.rows[0]
            }
        });

    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: err.message
        });
    }
})
//get song from cart
router.get("/cart", async (req, res) => {
    try {
        const { user_id } = req.query;
        if (!user_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID is required"
            });
        }
        const query = `
        SELECT * 
        FROM cart C
        JOIN SONG S ON S.SONG_ID = C.SONG_ID
        WHERE user_id = $1`;
        const cart = await db.query(query, [user_id]);

        res.status(200).json({
            status: "success",
            cart: cart.rows
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: err.message
        });
    }
})
//get purchased songs
router.get("/purchase", async (req, res) => {
    try {
        const { user_id } = req.query;
        if (!user_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID is required"
            });
        }
        const query = `
        SELECT * 
        FROM purchase_history P
        JOIN SONG S ON S.SONG_ID = P.SONG_ID
        WHERE user_id = $1`;
        const purchase = await db.query(query, [user_id]);

        res.status(200).json({
            status: "success",
            purchase: purchase.rows
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: err.message
        });
    }
})
//purchase song
router.post("/purchase", async (req, res) => {
    try {
        const { user_id } = req.body;
        if (!user_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID is required"
            });
        }
        const addedToCartQuery = `SELECT song_id FROM cart WHERE user_id = $1`;
        const addedToCartResult = await db.query(addedToCartQuery, [user_id]);

        if (addedToCartResult.rows.length === 0) {
            return res.status(400).json({
                status: "error",
                message: "No songs found in the cart for the user"
            });
        }

        const songIds = addedToCartResult.rows.map(row => row.song_id);

        // Remove songs from cart
        const removeFromCartQuery = `DELETE FROM cart WHERE user_id = $1`;
        await db.query(removeFromCartQuery, [user_id]);

        // Insert each song into purchase history
        const insertIntoPurchaseHistoryQuery = `
            INSERT INTO purchase_history (user_id, song_id, purchase_date) VALUES ($1, $2, $3)`;
        for (const songId of songIds) {
            await db.query(insertIntoPurchaseHistoryQuery, [user_id, songId, new Date()]);
        }

        res.status(200).json({
            status: "success",
            message: "Songs purchased successfully"
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: "error",
            message: err.message
        });
    }
});
//remove song from cart
router.delete("/cart", async (req, res) => {
    try {
        const { user_id, song_id } = req.body;
        if (!user_id || !song_id) {
            return res.status(400).json({
                status: "error",
                message: "User_id and Song_id are required"
            });
        }
        const removeFromCartQuery = `DELETE FROM cart WHERE user_id = $1 AND song_id = $2`;
        await db.query(removeFromCartQuery, [user_id, song_id]);

        res.status(200).json({
            status: "success",
            message: "Song removed from cart successfully"
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