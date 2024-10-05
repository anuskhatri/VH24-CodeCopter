const nodemailer = require('nodemailer');
const { pool } = require('../config/dbConfig');
require('dotenv').config();

const senderEmail = process.env.SENDER_EMAIL;
const senderPass = process.env.SENDER_APP_PASS;

const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: senderEmail,
        pass: senderPass
    }
});

const htmlContent = (postName,ngoContact,Donor,ngoName,ngoEmail) => {
    return `
        <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Accepted</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            color: #333;
            line-height: 1.6;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .email-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #4CAF50;
        }
        .content {
            margin-bottom: 20px;
        }
        .contact-info {
            background-color: #f9f9f9;
            padding: 15px;
            border-left: 4px solid #4CAF50;
        }
        a {
            color: #4CAF50;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="email-container">
        <h1>Your Request is Accepted for the ${postName}</h1>
        <p class="content">
            Dear ${Donor},
        </p>
        <p class="content">
            We are pleased to inform you that your request has been accepted for further communication. We appreciate your interest and are eager to assist you with the next steps.
        </p>
        <p class="content">
            Please find below the contact information of the institute for any further inquiries or follow-ups:
        </p>
        <div class="contact-info">
            <p><strong>Institute Name: ${ngoName}</strong> [Institute Name]</p>
            <p><strong>Contact Person: ${ngoContact}</strong> [Contact Person's Name]</p>
            <p><strong>Email: ${ngoEmail}</strong> <a href="mailto:[email@example.com]">[email@example.com]</a></p>
        </div>
        <p class="content">
            If you have any further questions, feel free to contact the institute directly.
        </p>
    </div>
</body>
</html>

    `;
};

const sendPullReqMail = async(senderEmail="khatrianas15@gmail.com",DonorEmail,postName,ngoContact,Donor,ngoName,ngoEmail) => {
    pool.query
    const mailOptions = {
        from: senderEmail,
        to: DonorEmail,
        subject: `New Order Request for ${supplier}`,
        html: htmlContent(postName,ngoContact,Donor,ngoName,ngoEmail)
    };

    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            console.error('Error sending email:', error);
        } else {
            console.log('Email sent:', info.response);
        }
    });
};

module.exports = sendPullReqMail;
