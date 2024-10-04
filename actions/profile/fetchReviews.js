const {pool} = require('../../config/dbConfig')

const getReviews = async (user_id=1 )=>{
    try{
        const {rows} = await pool.query('SELECT giver_id, rating , comments, feedback_date FROM feedback WHERE receiver_id = $1', [user_id])
        return rows
    }
    catch(error){
        console.log("ERROR at fetchReviews.js ",error)
    }

    }
    
module.exports = getReviews