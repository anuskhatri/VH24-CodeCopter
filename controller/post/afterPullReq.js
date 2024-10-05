const updatePullReq = require("../../actions/post/updatePullRequest")
const fetchUserData = require("../../actions/user/fetchUserData")
const fetchUserDataByPostId = require("../../actions/user/fetchUserDataByPostId")
const sendPullReqMail = require("../../utils/pullReqMail")
const fetchPostById = require("./fetchPostByIdCon")

const afterPullReq = async (req,res) => {
    try {
        const {pullId,acceptance,postId,donorId}=req.body
        const data=await fetchPostById(postId)
        const donor=await fetchUserData(donorId)        
        const ngo=await fetchUserDataByPostId(postId)

        updatePullReq(acceptance,pullId)
        
        if (acceptance==='accept') {
            sendPullReqMail(undefined,donor.email,data[0].title,ngo.contact_info,ngo.name,ngo.email)
        }

        return res.send(data).status(200)
    } catch (error) {
        res.status(500)
        console.log("ERROR at afterPullReq",error)
    }
}
module.exports = afterPullReq