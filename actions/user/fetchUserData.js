const { pool } = require('../../config/dbConfig');

const fetchUserData = async (userId) => {
    try {
        const { rows } = await pool.query(`
            SELECT 
                users.name, 
                users.email, 
                users.contact_info, 
            FROM 
                users
                WHERE 
                users.id = $1`, [userId]);
        
        return rows[0];
    } catch (error) {
        console.error("ERROR at fetchPostById:", error);
        throw new Error("ERROR at fetchPostById: " + error.message);
    }
}

module.exports = fetchUserData;
