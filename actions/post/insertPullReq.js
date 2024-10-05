const {pool} = require('../../config/dbConfig')

const insert_query = "INSERT INTO pull_req (request_id, funder_id, receiver_id, offer) VALUES ($1, $2, $3, $4) RETURNING *;"
const insertPullReq = async (request_id, funder_id, receiver_id, offer)=>{
    try{
        pool.query(insert_query, [request_id, funder_id, receiver_id, offer])
        return 
    }
    catch(error){
        console.log("ERROR at insertPullReq.js (Inserting query ",error)}
        
    }
    
module.exports = insertPullReq