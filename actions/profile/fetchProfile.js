const { pool } = require("../../config/dbConfig")

const profile_query = `
        SELECT
        u.name,
        u.contact_info,
        COALESCE(SUM(r.current_funded_amount), 0) AS total_funded_amount,
        COALESCE(SUM(p.amount_spent), 0) AS total_purchase_amount,
        COALESCE(count(r.id), 0) AS total_requests ,
        json_agg(   
            json_build_object(
                'type', t.type,
                'amount', t.amount,
                'transaction_date', t.transaction_date,
                'details', t.details
            )
        ) AS transaction_logs
    FROM users u
    LEFT JOIN requests r ON r.ngo_id = u.id
    LEFT JOIN purchases p ON p.ngo_id = u.id
    LEFT JOIN transaction_logs t ON t.user_id = u.id
    WHERE u.id = $1  -- User ID
    GROUP BY u.id;
`;


    const getProfile = async (user_id) =>{
    try{
        const {rows} = await pool.query(profile_query, [user_id])
        return rows
    }
    catch(error){
        console.log("ERROR at fetchProfile ",error)
    }
}
module.exports= getProfile