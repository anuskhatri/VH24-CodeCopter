const insertPullReq = require("../../actions/post/insertPullReq");

const insertPullReqCon = async (req, res)=>{ // donationPay for accessig the insert function of payByDonor.js
    try{
        const {request_id, funder_id, receiver_id, offer}=req.body
        
        await insertPullReq(request_id, funder_id, receiver_id, offer);
        return res.send('OK').status(200)
    }
    catch(error){
        console.log("ERROR at insertContributionCon.js ",error)
        res.status(500)
    }
}

module.exports = insertPullReqCon