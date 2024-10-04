const { Router } = require('express')
const fetchProfile = require('../controller/profile/fetchProfile')
const profileRoute=Router()

//CRUD
profileRoute.get('/fetch-profile/:userId', fetchProfile)

module.exports=profileRoute