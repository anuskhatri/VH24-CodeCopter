const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { pool } = require('../../config/dbConfig'); // PostgreSQL connection

async function registerUser(req, res) {
    const { username, email, password, contact_info, role } = req.body;

    try {
        // Check if the user already exists
        const userExists = await pool.query('SELECT * FROM users WHERE email = $1', [email]);

        if (userExists.rows.length > 0) {
            return res.status(400).json({ message: 'User with this email already exists' });
        }

        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);

        const newUser = await pool.query(
            'INSERT INTO users (name, email, password, role, contact_info) VALUES ($1, $2, $3, $4, $5) RETURNING id, name, email, role',
            [username, email, hashedPassword, role, contact_info]
        );

        const user = newUser.rows[0];

        const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, { expiresIn: '720h' });

        return res.status(201).json({
            message: 'User registered successfully',
            user: {
                id: user.id,
                username: user.name, // Consistent with `name` in the DB
                email: user.email,
                role: user.role,
            },
            token: token,
        });
    } catch (error) {
        console.error(error.message);
        return res.status(500).json({ message: 'Server error' });
    }
}

module.exports = registerUser;
