const { pool } = require('../../config/dbConfig')
const { redis } = require('../../config/redisServer')

const getReviews = async (user_id = 1) => {
    try {
        const data = redis.get(`fetchReviews:${user_id}`)
        if (data.length > 0) return JSON.parse(data)

        const { rows } = await pool.query('SELECT giver_id, rating , comments, feedback_date FROM feedback WHERE receiver_id = $1', [user_id])
        redis.set(`fetchReviews:${user_id}`, JSON.stringify(rows))
        return rows
    }
    catch (error) {
        console.log("ERROR at fetchReviews.js ", error)
    }
}

module.exports = getReviews

