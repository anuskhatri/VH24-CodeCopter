const addPost = require("../../actions/post/addPost");

const addPostCon = async (req, res) => {
    try {
        const { ngoId, requestedAmount, postDescription, postTitle, category } = req.body

        const data = await addPost(ngoId, requestedAmount, postDescription, postTitle, category);
        return res.send(data).status(200)
    } catch (err) {
        console.error('Error inserting request:', err);
        res.status(500)
    }
};

module.exports = addPostCon