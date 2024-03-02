const express = require("express");
const router = express.Router();
const db = require('../db');

//show deteail of user

router.get("/profile/:user_id", async (req, res) => {
    try {
        const user_id = req.params.user_id;
        const { self_id } = req.body;
        if (!user_id || !self_id) {
            return res.status(400).json({
                status: "error",
                message: "User ID is required"
            });
        }

        //have to check whether the user is friend or requested.

        const profileQuery = `
            select * from user_db where user_id = $1`;
        const profileResult = await db.query(profileQuery, [user_id]);

        res.status(200).json({
            status: "success",
            data: {
                profile: profileResult.rows
            }
        })

    } catch (err) {
        console.log(err);
        res.status(500).json({
            status: "error",
            message: "An internal server error occurred"
        });
    }
})


module.exports = router;