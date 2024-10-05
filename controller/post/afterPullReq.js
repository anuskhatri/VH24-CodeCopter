const updatePullReq = require("../../actions/post/updatePullRequest")
const sendSupplierMail = require("../../utils/mailer")
const sendPullReqMail = require("../../utils/pullReqMail")
const fetchPostById = require("./fetchPostByIdCon")

const fetchPullReq = async (req,res) => {
    try {
        const {pullId,acceptance,postId}=req.body
        const data=await fetchPostById(postId)
        

        if (acceptance==='accept') {
            sendPullReqMail
        }

        updatePullReq(acceptance,pullId)

        return res.send(data).status(200)
    } catch (error) {
        res.status(500)
        console.log("ERROR at fetchPullReq",error)
    }
}
module.exports = fetchPullReq