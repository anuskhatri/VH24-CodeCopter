const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const pool = require('../../config/dbConfig'); 

// Function to login a user
async function loginUser(req, res) {
    const { email, password } = req.body;

    try {
        // Check if the user exists
        const user = await pool.query('SELECT * FROM users WHERE email = $1', [email]);

        if (user.rows.length === 0) {
            return res.status(400).json({ message: 'Invalid email or password' });
        }

        const userData = user.rows[0];

        const isMatch = await bcrypt.compare(password, userData.password);

        if (!isMatch) {
            return res.status(400).json({ message: 'Invalid email or password' });
        }

        // If password is correct, generate a JWT token
        const token = jwt.sign({ id: userData.id }, process.env.JWT_SECRET, { expiresIn: '720h' });

        // Send back the token and user info
        return res.status(200).json({
            message: 'Login successful',
            user: {
                id: userData.id,
                username: userData.username,
                email: userData.email,
                role: userData.role
            },
            token: token
        });
    } catch (error) {
        console.error(error.message);
        return res.status(500).json({ message: 'Server error' });
    }
}

module.exports = loginUser;
