
const fetchPostById = async (req,res) => {
    try {
        const data=await fetchAllPost()
        return res.send(data).status(200)
    } catch (error) {
        res.status(500)
        console.log("ERROR at fetchPostById",error)
    }
}
module.exports = fetchPostById