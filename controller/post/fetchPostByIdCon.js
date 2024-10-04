const fetchPostById = require("../../actions/post/fetchPostById")

const fetchPostByIdCon = async (req, res) => {
    try {
        const {postId} = req.params
        const data = await fetchPostById(postId)

        return res.send(data).status(200)
    } catch (error) {
        res.status(500)
        console.log("ERROR at fetchPostByIdCon", error)
    }
}
module.exports = fetchPostByIdCon