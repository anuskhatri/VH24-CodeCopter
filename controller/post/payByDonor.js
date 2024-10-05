const payByDonor = require("../../actions/post/payByDonor")

const donationPay = async (req, res)=>{ // donationPay for accessig the insert function of payByDonor.js
    try{
        const {doner_id, post_id, amount}=req.body
        
        await payByDonor(doner_id, post_id, amount);
        return res.send('OK').status(200)
    }
    catch(error){
        console.log("ERROR at payByDonor.js ",error)
        res.status(500)
    }
}

module.exports = donationPay