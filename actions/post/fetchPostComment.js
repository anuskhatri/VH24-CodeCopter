const { pool } = require("../../config/dbConfig");

const fetchPostComments = async (postId) => {
  const query = `
    SELECT 
      donations.funder_id, 
      donations.donation_amount, 
      donations.donation_date, 
      users.name 
    FROM donations
    JOIN users ON donations.funder_id = users.id
    WHERE donations.request_id = $1;
  `;

  try {
    const result = await pool.query(query, [postId]);
    return result.rows; 
  } catch (err) {
    console.error('Error fetching fetchPostComment:', err);
    throw new Error("Error fetching fetchPostComment");
    
}
};

module.exports = fetchPostComments;
