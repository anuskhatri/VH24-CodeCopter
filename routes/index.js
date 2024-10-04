const express = require('express')
const profileRoute = require('./profile')
const postRoute = require('./post')
const indexRoute = express.Router()

// Internal Imports


// Mount authRoute without middleware
// indexRoute.use('/auth', authRoute)

// Mount middleware to apply to routes after authRoute
// indexRoute.use(validateUserMiddleware)

// Mount routes that require authentication
indexRoute.use('/profile', profileRoute)
indexRoute.use('/post',postRoute)

module.exports = indexRoute
