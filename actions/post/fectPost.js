const { pool } = require('../../config/dbConfig')

const fetchAllPost = async () => {
    try {
        const {rows} = await pool.query(`SELECT user.name, requests.title,requests.description, requests.current_funded_aount,updated_at
            JOIN user.id=requests.ngo_id WHERE requests.status=$1`, ['open'])
        console.log(rows)
        return rows
    } catch (error) {
        throw new Error("ERROR at fetchALLPOST ",error);
    }
}
module.exports = fetchAllPost