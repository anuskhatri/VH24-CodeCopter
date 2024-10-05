const jsonwebtoken = require("jsonwebtoken");

const verifyOtp = async (req, res) => {
    const { otp, token } = req.body;

    try {
        // Verify the JWT token and extract the code
        const decoded = jsonwebtoken.verify(token, process.env.JWT_SECRET);
        const code = decoded.code;

        // Check if the OTP is valid (you should retrieve it from your database or storage)
        if (otpStore[code] && otpStore[code] === otp) {
            // OTP is valid
            delete otpStore[code]; // Remove OTP after successful verification

            return res.status(200).json({ message: 'OTP verified successfully' });
        } else {
            // Invalid OTP
            return res.status(400).json({ message: 'Invalid OTP' });
        }
    } catch (error) {
        console.error('Error verifying OTP:', error);
        return res.status(500).json({ message: 'Internal server error' });
    }
}
module.exports=verifyOtp