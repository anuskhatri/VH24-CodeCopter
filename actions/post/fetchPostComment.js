const { pool } = require("../../config/dbConfig");

const fetchPostComments = async (postId) => {
  const query = `
    SELECT 
      donation.funder_id, 
      donation.donation_amount, 
      donation.donation_date, 
      users.name 
    FROM donation
    JOIN users ON donation.funder_id = users.id
    WHERE donation.request_id = $1;
  `;

  try {
    const result = await pool.query(query, [postId]);
    return result.rows; 
  } catch (err) {
    console.error('Error fetching fetchPostComment:', err);
    res.status(500)
}
};

module.exports = fetchPostComments;
