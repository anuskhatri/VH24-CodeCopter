const getReviews = require("../../actions/profile/fetchReviews")

const fetchReviews = async (req, res)=>{
    try{
        const data = await getReviews()
        return res.send(data).status(200)
    }
    catch(error){
        console.log("ERROR at fetchReviews.js ",error)
        res.status(500)
    }
}

module.exports = fetchReviews