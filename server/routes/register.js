const express = require("express");
const router = express.Router();
const db = require('../db');

// Register
router.post('/', async (req, res) => {
    const { username, email, password, phone_number } = req.body;
    try {
        if (!username || !email || !password || !phone_number) {
            return res.status(400).json({
                status: "error",
                message: "Username, email, password, and phone number are required"
            });
        }
        // Call the stored procedure to add the user
        const result = await db.query('CALL add_user($1, $2, $3, $4)', [username, email, password, phone_number]);

        res.status(201).json({
            status: "success",
            message: "User added successfully",
            data: result.rows[0]
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