const getProfile = require("../../actions/profile/fetchProfile")

const fetchProfile = async (req,res) => {
    try {
        const data=await getProfile()
        return res.send(data).status(200)
    } catch (error) {
        console.log("ERROR at fetchProfile ",error)
        res.status(500)
    }
}
module.exports = fetchProfile