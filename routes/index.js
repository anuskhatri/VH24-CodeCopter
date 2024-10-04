const express = require('express')
const indexRoute = express.Router()

// Internal Imports


// Mount authRoute without middleware
// indexRoute.use('/auth', authRoute)

// Mount middleware to apply to routes after authRoute
// indexRoute.use(validateUserMiddleware)

// Mount routes that require authentication

module.exports = indexRoute
