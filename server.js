require('dotenv').config()
const express = require('express')
const cors = require('cors')
const { connectdb } = require('./config/dbConfig')
const indexRoute = require('./routes')

const app = express()
const PORT = 4000

// Middleware
app.use(express.json())
app.use(cors({
    origin: '*', // your client origin
    credentials: true
}))

// Connect to database
connectdb()

// API Routes
app.use('/api', indexRoute)


// Start the server
app.listen(PORT, () => {
    console.log(`Running on port ${PORT}`)
})
