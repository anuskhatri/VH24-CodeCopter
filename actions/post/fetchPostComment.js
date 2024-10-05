const { pool } = require("../../config/dbConfig");
const { redis } = require("../../config/redisServer");

const fetchPostComments = async (postId) => {
  const data = redis.get(`postComment:${postId}`)
  if (data.length > 0) return JSON.parse(data)

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
    redis.set(`postComment:${postId}`, JSON.stringify(result.rows))

    return result.rows;
  } catch (err) {
    console.error('Error fetching fetchPostComment:', err);
    throw new Error("Error fetching fetchPostComment");

  }
};

module.exports = fetchPostComments;
