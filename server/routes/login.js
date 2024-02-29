const express = require("express");
const router = express.Router();
const db = require('../db');


//Authentication
router.post('/', async (req, res) => {
    const { username, password, userType } = req.body;
    //console.log(username, password, userType);
    try {
        if (userType === 'user') {
            // Perform authentication logic (replace this with your actual authentication logic)
            const result = await db.query('SELECT * FROM user_account WHERE user_name = $1 AND user_password = $2', [username, password]);

            if (result.rows.length > 0) {
                // Authentication successful
                res.json({ success: true });
            } else {
                // Authentication failed
                res.json({ success: false });
            }
        }
        else {
            const result = await db.query('SELECT * FROM admin WHERE admin_name = $1 AND admin_password = $2', [username, password]);

            if (result.rows.length > 0) {
                // Authentication successful
                res.json({
                    success: true,
                    admin_name: result.rows[0].admin_name,
                    admin_id: result.rows[0].admin_id
                });
            } else {
                // Authentication failed
                res.json({ success: false });
            }
            //console.log(result);
        }
    } catch (error) {
        console.error('Error during authentication:', error);
        res.status(500).json({ success: false, error: 'An unexpected error occurred. Please try again later.' });
    }
});


module.exports = router;