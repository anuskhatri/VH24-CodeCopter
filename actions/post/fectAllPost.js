const { pool } = require('../../config/dbConfig');

const fetchAllPost = async () => {
    try {
        const { rows } = await pool.query(`
            SELECT 
                users.name, 
                requests.title, 
                requests.description, 
                requests.current_funded_amount, 
                requests.updated_at
            FROM 
                requests
            JOIN 
                users ON users.id = requests.ngo_id 
            WHERE 
                requests.status = $1`, ['Open']);
        
        return rows;
    } catch (error) {
        console.log(error);
        throw new Error("ERROR at fetchAllPost: " + error);
    }
}

module.exports = fetchAllPost;
