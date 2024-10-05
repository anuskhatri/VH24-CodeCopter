const nodemailer = require('nodemailer');
const { v4: uuidv4 } = require('uuid');
const { pool } = require('../../config/dbConfig');
const jwt = require('jsonwebtoken');
require('dotenv').config();

const senderEmail = process.env.SENDER_EMAIL;
const senderPass = process.env.SENDER_APP_PASS;
const jwtSecret = process.env.JWT_SECRET;

if (!senderEmail || !senderPass || !jwtSecret) {
    throw new Error('Missing required environment variables. Please check SENDER_EMAIL, SENDER_APP_PASS, and JWT_SECRET.');
}

const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: senderEmail,
        pass: senderPass
    }
});

const orderToSupplier = async (product, quantity, supplierName, supplierEmail) => {
    try {
        const code = uuidv4();
        const token = jwt.sign({ code: code }, jwtSecret, { expiresIn: '720h' });
        const url = `http://localhost:3000/orderToSupplier/${token}`;

        const mailOptions = {
            from: senderEmail,
            to: supplierEmail,
            subject: `New Order Request for ${product}`,
            html: htmlContent(product, quantity, url)
        };

        // Send email
        transporter.sendMail(mailOptions, (error, info) => {
            if (error) {
                console.error('Error sending email:', error);
            } else {
                console.log('Email sent:', info.response);
            }
        });

        // If you want to store the order details into the database
        // Example: Insert order into the database (assuming you have a suitable table)
        const query = 'INSERT INTO orders (product, quantity, code, supplier_email) VALUES ($1, $2, $3, $4)';
        await pool.query(query, [product, quantity, code, supplierEmail]);

        console.log('Order saved to the database.');

    } catch (error) {
        console.error('Error processing order:', error);
    }
};

const htmlContent = (product, quantity, url) => {
    return `
        <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Order Request</title>
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
        .order-info {
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
        <h1>Order Request: ${product}</h1>
        <p class="content">
            Dear ${supplierName},
        </p>
        <p class="content">
            We would like to place an order for the following product:
        </p>
        <div class="order-info">
            <p><strong>Product:</strong> ${product}</p>
            <p><strong>Quantity:</strong> ${quantity}</p>
        </div>
        <p class="content">
            Please confirm the receipt of this order and proceed with the necessary steps. To confirm the order, kindly visit the following link:
        </p>
        <p class="content">
            <a href="${url}">Confirm Order</a>
        </p>
        <p class="content">
            If you have any further questions or require additional information, feel free to reach out.
        </p>
    </div>
</body>
</html>
    `;
};

module.exports = orderToSupplier;
