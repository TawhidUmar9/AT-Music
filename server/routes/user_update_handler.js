const express = require("express");
const router = express.Router();
const db = require('../db');

router.put("/update/:user_id", async (req, res) => {
    try {
        const { user_id } = req.params;
        const { email, username, phone_number } = req.body;
        if (!user_id || !email || !username || !phone_number) {
            return res.status(400).json({
                status: "error",
                message: "User ID, flag, and update are required"
            });
        }
        const query = `call update_user($1, $2, $3, $4)`
        const result = await db.query(query, [email, username, phone_number, user_id]);
        res.status(200).json({
            status: "success",
            message: "User updated successfully"
        });
    } catch (err) {
        console.error(err.message);
        res.status(500).send("Server Error");
    }
});


module.exports = router;