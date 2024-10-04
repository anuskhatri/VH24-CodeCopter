const {pool} = require('../../config/dbConfig')

const insert_query = "INSERT INTO donations (funder_id, request_id, donation_amount) VALUES ($1, $2, $3) RETURNING *;"
const payByDonor = async (user_id, doner_id, post_id, amount)=>{
    try{
        pool.query(insert_query, [doner_id, post_id, amount])
        return 
    }
    catch(error){
        console.log("ERROR at payByDonor.js(Inserting query ",error)}
        
    }
    
module.exports = payByDonor
