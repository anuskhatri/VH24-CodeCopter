const { pool } = require("../../config/dbConfig");

const fetchPostPullReq = async (postId) => {
  const query = `
    SELECT 
      pull_req.funder_id, 
      pull_req.offer, 
      pull_req.receiver_id, 
      funder.name AS funder_name, 
      receiver.name AS receiver_name
    FROM pull_req
    JOIN users AS funder ON pull_req.funder_id = funder.id
    JOIN users AS receiver ON pull_req.receiver_id = receiver.id
    WHERE pull_req.request_id = $1;
  `;

  try {
    const result = await pool.query(query, [postId]);
    return result.rows; 
  } catch (err) {
    console.error('Error fetching fetchPostPullReq:', err);
    throw new Error("Error fetching fetchPostPullReq");
  }
};

module.exports = fetchPostPullReq;
