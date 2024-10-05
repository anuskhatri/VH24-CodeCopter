const insertReview = require("../../actions/post/insertReview");

const insertReviewCon = async (req, res)=>{ // donationPay for accessig the insert function of payByDonor.js
    try{
        const {giver_id, receiver_id, rating, comments}=req.body
        
        await insertReview(giver_id, receiver_id, rating, comments);
        return res.send('OK').status(200)
    }
    catch(error){
        console.log("ERROR at insertReviewCon.js ",error)
        res.status(500)
    }
}

module.exports = insertReviewCon