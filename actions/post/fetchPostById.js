const { pool } = require('../../config/dbConfig');

const fetchPostById = async (postId) => {
    try {
        const { rows } = await pool.query(`
            SELECT 
                users.name, 
                requests.id, 
                requests.title, 
                requests.description, 
                requests.current_funded_amount, 
                requests.requested_amount,
                requests.status,
                requests.updated_at,
                requests.created_at
            FROM 
                requests
            JOIN 
                users ON users.id = requests.ngo_id 
            WHERE 
                requests.id = $1`, [postId]);
        
        return rows;
    } catch (error) {
        console.error("ERROR at fetchPostById:", error);
        throw new Error("ERROR at fetchPostById: " + error.message);
    }
}

module.exports = fetchPostById;
