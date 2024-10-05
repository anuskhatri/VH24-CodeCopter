const jwt = require('jsonwebtoken');
const { pool } = require('../../config/dbConfig');
const { comparePassword } = require('../../utils/helper');
const tokenSecret = process.env.JWTTOKENSECRET;
const tokenOptions = {
    expiresIn: '720h', // Changed '720hr' to '720h' for standard format
};

const validateCredentials = async (accountNumber, pin) => {
    try {
        const query = `
            SELECT email 
            FROM users `;
        const result = await pool.query(query, [accountNumber]);

        if (result.rows.length === 0) {
            return { valid: false, error: "Invalid credentials" };
        }

        const user = result.rows[0];
        const userName = `${user.first_name} ${user.last_name}`;

        const isPinValid = comparePassword(`${pin}`, user.pin);
        if (!isPinValid) {
            return { valid: false, error: "Invalid credentials" };
        }

        return { valid: true, userId: user.id, userName: userName, error: null };
    } catch (error) {
        console.error("Error validating credentials:", error);
        return { valid: false, error: "An internal error occurred" };
    }
}

const generateToken = (userId) => {
    const tokenPayload = { id: userId };
    return jwt.sign(tokenPayload, tokenSecret, tokenOptions);
}

const createUser = async (req, res) => {
    try {
        const { accountNumber, pin } = req.body;
        const { valid, userId, userName, error } = await validateCredentials(Number(accountNumber), pin);

        if (!valid) {
            return res.status(200).send({ valid: false, error: error });
        }

        const token = generateToken(userId);
        const userDetails = await getUserDetails(userId);
        const investmentDetails = await investmentPortfolio(token, userId)
        return res.status(200).json({ ...userDetails, ...investmentDetails, valid: true, token: token, name: userName });
    } catch (error) {
        console.error("Error creating user:", error);
        return res.status(500).json({ error: "Something went wrong" });
    }
}

module.exports = createUser;
