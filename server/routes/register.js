const express = require("express");
const router = express.Router();
const db = require('../db');



// Register
router.post('/', async (req, res) => {
    const { username, email, password, phone_number } = req.body;
    try {
        // Check if username already exists
        const checkQueryUserName = `SELECT * FROM user_db WHERE username = $1`;
        const checkResultUN = await db.query(checkQueryUserName, [username]);
        if (checkResultUN.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "Username already exists"
            });
        }

        // Check if email already exists
        const checkQueryEmail = `SELECT * FROM user_db WHERE email = $1`;
        const checkResultEmail = await db.query(checkQueryEmail, [email]);
        if (checkResultEmail.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "Email already exists"
            });
        }

        // Check if phone number already exists
        const checkQueryPhoneNumber = `SELECT * FROM user_db WHERE phone_number = $1`;
        const checkResultPN = await db.query(checkQueryPhoneNumber, [phone_number]);
        if (checkResultPN.rows.length > 0) {
            return res.status(400).json({
                status: "error",
                message: "Phone number already exists"
            });
        }

        // If all checks pass, insert the user into the database
        const query = `INSERT INTO user_db (username, password, email, phone_number, created_on)
                        VALUES ($1, $2, $3, $4, $5) RETURNING *`;
        const result = await db.query(query, [username, password, email, phone_number, new Date()]);
        res.status(201).json({
            status: "success",
            message: "User added successfully",
            data: result.rows[0]
        });
    } catch (err) {
        console.error(err); // Log the error for debugging
        res.status(500).json({
            status: "error",
            message: "Internal Server Error" // Generic error message
        });
    }
});


module.exports = router;