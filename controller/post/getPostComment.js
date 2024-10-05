const fetchPostComments = require("../../actions/post/fetchPostCOmment")

const getPostComment = async (req, res) => {
    try {
        const { postId } = req.params
        const data = await fetchPostComments(postId)
        res.send(data)
    } catch (error) {
        console.error('Error fetching fetchPostComment:', err);
        res.status(500)
    }
}
module.exports=getPostComment