const {pool} = require('../../config/dbConfig')

const insert_query = "INSERT INTO donations (funder_id, request_id, donation_amount) VALUES ($1, $2, $3, $4) RETURNING *;"
const insertContribution = async (donation_id, post_id, amount)=>{
    try{
        pool.query(insert_query, [donation_id, post_id, amount])
        return 
    }
    catch(error){
        console.log("ERROR at insertContribution.js(Inserting query ",error)}
        
    }
    
module.exports = insertContribution