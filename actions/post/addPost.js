const { pool } = require("../../config/dbConfig");

const addPost = async (ngoId, requestedAmount, postDescription, postTitle, categories) => {
  const query = `
    INSERT INTO requests (ngo_id, requested_amount, description, created_at, title, categories)
    VALUES ($1, $2, $3, NOW(), $4, $5) RETURNING *;
  `;

  const values = [ngoId, Number(requestedAmount), postDescription, postTitle, categories];

  try {
    const data = await pool.query(query, values);
    return data.rows;
  } catch (err) {
    console.error('Error inserting request:', err);
    throw new Error(`Failed to add post: ${err.message}`);
  }
};

module.exports = addPost;
