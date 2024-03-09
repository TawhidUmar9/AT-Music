const express = require("express");
const router = express.Router();
const db = require('../db');

router.post('/', async (req, res) => {
  const { username, password, userType } = req.body;

  try {
    if (userType === 'user') {
      const result = await db.query('SELECT * FROM user_db WHERE username = $1', [username]);

      if (result.rows.length === 0) {
        // If no user found, authentication fails
        console.log("No user found");
        return res.json({ success: false });
      }
      const pwd = await db.query('SELECT hash_password($1) as encrypted_password', [password]);
      if (pwd.rows[0].encrypted_password !== result.rows[0].password) {
        // If passwords don't match, authentication fails
        console.log("Passwords don't match");
        console.log(pwd.rows[0].encrypted_password);
        console.log(password)
        return res.json({ success: false });
      }

      // Update last login time for the user
      await db.query('UPDATE user_db SET last_login = NOW() WHERE user_id = $1', [result.rows[0].user_id]);

      // Authentication successful, return user data
      res.json({
        success: true,
        userData: {
          user_name: username,
          user_id: result.rows[0].user_id,
          user_email: result.rows[0].email,
          user_phone_number: result.rows[0].phone_number,
          user_created_on: result.rows[0].created_on,
          user_last_login: result.rows[0].last_login,
          user_last_update: result.rows[0].last_updated
        }
      });
    } else if (userType === 'admin') {
      // Query the database to get the admin details
      const result = await db.query('SELECT * FROM admin WHERE admin_name = $1 AND admin_password = $2', [username, password]);

      if (result.rows.length === 0) {
        // If no admin found or password doesn't match, authentication fails
        return res.json({ success: false });
      }

      // Authentication successful, return admin data
      res.json({
        success: true,
        adminData: {
          admin_name: username,
          admin_id: result.rows[0].admin_id,
          admin_image: result.rows[0].admin_image
        }
      });
    } else {
      // If userType is neither 'user' nor 'admin', return authentication failure
      console.log("User type is neither 'user' nor 'admin'");
      res.json({ success: false });
    }
  } catch (error) {
    // Handle unexpected errors
    console.error('Error during authentication:', error);
    res.status(500).json({ success: false, error: 'An unexpected error occurred. Please try again later.' });
  }
});

module.exports = router;
