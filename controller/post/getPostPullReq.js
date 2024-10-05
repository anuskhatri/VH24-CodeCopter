const fetchPostPullReq = require("../../actions/post/fetchPostPullReq");

const getPostPullReq = async (req, res) => {
    try {
        const { postId } = req.params
        const data = await fetchPostPullReq(postId)
        res.send(data)
    } catch (error) {
        console.error('Error fetching fetchPostComment:', err);
        res.status(500)
    }
}
module.exports=getPostPullReq