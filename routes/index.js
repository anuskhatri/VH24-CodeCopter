const express = require('express')
const postRoute = require('./post')
const indexRoute = express.Router()

// Internal Imports


// Mount authRoute without middleware
// indexRoute.use('/auth', authRoute)

// Mount middleware to apply to routes after authRoute
// indexRoute.use(validateUserMiddleware)

indexRoute.use('/post',postRoute)

module.exports = indexRoute
