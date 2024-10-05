const { pool } = require("../../config/dbConfig");

const update_query =
  "UPDATE pull_req SET status = $1, acceptance = $2 WHERE id = $3";

const updatePullReq = async (acceptance, pullId) => {
  try {
    let accept;
    if (acceptance == "accept") {
      accept = true;
    } else {
      accept = false;
    }
    pool.query(update_query, ["close", Boolean(accept), pullId]);
  } catch (error) {
    console.log("ERROR at updatePullRequest.js (Updating query):", error);
    throw error; // Re-throw the error so the calling function can handle it
  }
};

module.exports = updatePullReq;
