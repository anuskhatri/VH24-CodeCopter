const { Router } = require('express')
const fetchProfile = require('../controller/profile/fetchProfile')
const profileRoute=Router()

//CRUD
profileRoute.get('/fetchProfile', fetchProfile)

module.exports=profileRoute