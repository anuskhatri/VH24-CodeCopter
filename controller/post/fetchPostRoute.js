const fetchAllPost = require('../../actions/post/fectAllPost')
const { pool } = require('../../config/dbConfig')

const fetchAllPostRoute = async (req,res) => {
    try {
        const data=await fetchAllPost()
        data.forEach((obj) => {
            obj.pending_amount = String(Number(obj.requested_amount)-Number(obj.current_funded_amount));
            
        });
        return res.send(data).status(200)
    } catch (error) {
        res.status(500)
        console.log("ERROR at fetchALLPOSTRoute ",error)
    }
}
module.exports = fetchAllPostRoute