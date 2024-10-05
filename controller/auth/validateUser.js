const jwt = require('jsonwebtoken');
const { pool } = require('../../config/dbConfig');
const { comparePassword } = require('../../utils/helper');
const getUserDetails = require('../../models/user/getUserData');
const { getUserMutualFunds } = require('../../models/investement/mutualFunds/getUserMutualF');
const getUserid = require('../../models/user/getUserid');
const investmentPortfolio = require('../../models/investement/investmentPortfolio');

const tokenSecret = process.env.JWTTOKENSECRET;

const validateCredentials = async (token, pin) => {
    try {
        const decoded = jwt.verify(token, tokenSecret);
        const userId = decoded.id;

        const findUser = await pool.query("SELECT pin, account_number FROM account WHERE id=$1", [userId]);

        if (findUser.rows.length === 0) {
            return { valid: false, error: "Invalid credentials" };
        }

        const userPin = findUser.rows[0].pin;
        const isPasswordValid = comparePassword(`${pin}`, userPin); // pass pin as string

        if (!isPasswordValid) {
            return { valid: false, error: "Invalid credentials" };
        }

        return { valid: true, error: null };
    } catch (err) {
        if (err.name === 'TokenExpiredError' || err.name === 'JsonWebTokenError') {
            return { valid: false, error: "Session expired" };
        }
        console.error("Error validating credentials:", err);
        return { valid: false, error: "An internal error occurred" };
    }
}

const validateUser = async (req, res) => {
    try {
        //accountNumber->stores Token
        const { accountNumber, pin } = req.body;
        const { valid, error } = await validateCredentials(accountNumber, pin);

        if (!valid) {
            return res.status(200).send({ valid: false, error: error });
        }

        const { id } = getUserid(accountNumber);
        const userDetails = await getUserDetails(id);

        const investmentDetails = await investmentPortfolio(accountNumber, id)
        return res.status(200).send({ 
            ...userDetails, 
            ...investmentDetails,
            valid: true, 
            name: `${userDetails.personal_details.first_name} ${userDetails.personal_details.last_name}` 
        });
    } catch (error) {
        console.error("Error validating user:", error);
        return res.status(500).send({ error: "Something went wrong" });
    }
}

module.exports = validateUser;
