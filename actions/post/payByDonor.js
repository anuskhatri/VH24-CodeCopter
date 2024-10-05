const { pool } = require('../../config/dbConfig')

const insert_query = "INSERT INTO donations (funder_id, request_id, donation_amount,receiver_id) VALUES ($1, $2, $3,$4) RETURNING *;"
const payByDonor = async (doner_id, post_id, amount) => {
    try {
        const receiver_id = await pool.query('SELECT ngo_id FROM requests WHERE id=$1', [post_id])
        
        pool.query(insert_query, [doner_id, post_id, amount, receiver_id.rows[0].ngo_id])
        return
    }
    catch (error) {
        console.log("ERROR at payByDonor.js(Inserting query ", error)
        throw new Error("ERROR at payByDonor.js(Inserting query");
        
    }

}

module.exports = payByDonor
