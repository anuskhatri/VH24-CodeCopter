const fetchAllPost = require('../../actions/post/fectPost')
const { pool } = require('../../config/dbConfig')

const fetchAllPostRoute = async (req,res) => {
    try {
        const data=await fetchAllPost()
        return res.send(data).status(200)
    } catch (error) {
        res.status(500)
        console.log("ERROR at fetchALLPOSTRoute ",error)
    }
}
module.exports = fetchAllPostRoute