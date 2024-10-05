const insertContribution = require("../../actions/post/insertContribution");

const insertContributionCon = async (req, res)=>{ // donationPay for accessig the insert function of payByDonor.js
    try{
        const {donation_id, post_id, amount}=req.body
        
        await insertContribution(donation_id, post_id, amount);
        return res.send('OK').status(200)
    }
    catch(error){
        console.log("ERROR at insertContributionCon.js ",error)
        res.status(500)
    }
}

module.exports = insertContributionCon