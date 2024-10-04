const {pool} = require('../../config/dbConfig')

const insert_query = "INSERT INTO feedback (giver_id, receiver_id, rating, comments) VALUES ($1, $2, $3, $4) RETURNING *;"
const insertReview = async (giver_id, receiver_id, rating, comments)=>{
    try{
        pool.query(insert_query, [giver_id, receiver_id, rating, comments])
        return 
    }
    catch(error){
        console.log("ERROR at insertReview.js(Inserting query ",error)}
        
    }
    
module.exports = insertReview