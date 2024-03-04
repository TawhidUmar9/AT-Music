const express = require("express");
const router = express.Router();
const db = require('../db');

router.put("/update/:user_id", async (req, res) => {
    try {
        const { user_id } = req.params;
        const { flag, update } = req.body;
        if (!user_id || !flag || !update) {
            return res.status(400).json({
                status: "error",
                message: "User ID, flag, and update are required"
            });
        }
        let query = `UPDATE user_db `;
        if (flag === "password") {
            query += `SET password = '${update}' WHERE user_id = ${user_id}`;
        } else if (flag === "email") {
            query += `SET email = '${update}' WHERE user_id = ${user_id}`;
        } else if (flag === "username") {
            query += `SET username = '${update}' WHERE user_id = ${user_id}`;
        } else if (flag === "phone_number") {
            query += `SET phone_number = '${update}' WHERE user_id = ${user_id}`;
        } else {
            return res.status(400).json({
                status: "error",
                message: "Invalid flag"
            });
        }
        const result = await db.query(query);
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