const { pool } = require('../../config/dbConfig');
const { redis } = require('../../config/redisServer');
const updateAllPost = require('../redis/updatePostCache');

const fetchAllPost = async () => {
    try {
        const data=redis.get('allPost')
        if (data.length>0) return JSON.parse(data)
        updateAllPost()

        const { rows } = await pool.query(`
            SELECT 
                users.name, 
                requests.id, 
                requests.title, 
                requests.description, 
                requests.current_funded_amount, 
                requests.requested_amount, 
                requests.updated_at
            FROM 
                requests
            JOIN 
                users ON users.id = requests.ngo_id 
            WHERE 
                requests.status ILIKE $1
        `, ['Open']);        
        
        return rows;
    } catch (error) {
        console.log(error);
        throw new Error("ERROR at fetchAllPost: " + error);
    }
}

module.exports = fetchAllPost;
