const { pool } = require('../../config/dbConfig');

const fetchUserDataByPostId = async (postId) => {
    try {
        const { rows } = await pool.query(`
            SELECT 
                users.name,
                users.email,
                users.conatct_info,
            FROM 
                requests
            JOIN 
                users ON users.id = requests.ngo_id 
            WHERE 
                requests.id = $1`, [postId]);
        
        return rows[0];
    } catch (error) {
        console.error("ERROR at fetchUserDataByPostId:", error);
        throw new Error("ERROR at fetchUserDataByPostId: " + error.message);
    }
}

module.exports = fetchUserDataByPostId;
