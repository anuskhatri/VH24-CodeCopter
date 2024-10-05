const nodemailer = require('nodemailer');
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

const htmlContent = (supplier, orders, location) => {
    return `
        <!DOCTYPE html>
        <html lang="en-US">
        <head>
            <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
            <title>Order Alert</title>
            <style type="text/css">
                a:hover {
                    text-decoration: underline !important;
                }
            </style>
        </head>
        <body style="margin: 0px; background-color: #f2f3f8;">
            <table width="100%" style="font-family: 'Open Sans', sans-serif;">
                <tr>
                    <td>
                        <table width="100%" align="center" style="background-color: #f2f3f8; max-width:670px; margin:0 auto;">
                            <tr><td style="text-align:center; padding:40px 0;"><h1>Emergency Alert</h1></td></tr>
                            <tr><td style="background:#fff; padding:20px 30px; border-radius:3px;">
                                <p>Dear ${supplier},</p>
                                <p>There is an order for the following items:</p>
                                <p><strong>Order Details:</strong> ${orders}</p>
                                <p>Please fulfill the requirement at the following location:</p>
                                <p><strong>Location:</strong> ${location}</p>
                            </td></tr>
                        </table>
                    </td>
                </tr>
            </table>
        </body>
        </html>
    `;
};

const sendSupplierMail = async(supplierEmail='khatrianas15@gmial.com', supplier='Anus', orders='10kg Rice', location) => {
    const mailOptions = {
        from: senderEmail,
        to: supplierEmail,
        subject: `New Order Request for ${supplier}`,
        html: htmlContent(supplier, orders, location)
    };

    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            console.error('Error sending email:', error);
        } else {
            console.log('Email sent:', info.response);
        }
    });
};

module.exports = sendSupplierMail;
