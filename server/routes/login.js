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
            const result = await db.query('SELECT * FROM user_db WHERE username = $1 AND password = $2', [username, password]);
        
            if (result.rows.length > 0) {
            // Authentication successful
            res.json({
               success: true,
               userData: {
                  user_name: result.rows[0].username,
                  user_id: result.rows[0].user_id,
                  user_email: result.rows[0].email,
                  user_phone_number: result.rows[0].phone_number,
                  user_created_on: result.rows[0].created_on
               }
              });
            } else {
            // Authentication failed
            res.json({ success: false });
            }
        }
        else{
            const result = await db.query('SELECT * FROM admin WHERE admin_name = $1 AND admin_password = $2', [username, password]);
        
            if (result.rows.length > 0) {
            // Authentication successful
            res.json({ 
              success: true,
              adminData: {
                admin_name: result.rows[0].admin_name,
                admin_id: result.rows[0].admin_id,
                admin_image: result.rows[0].admin_image
              }
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