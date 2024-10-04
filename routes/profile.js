const { Router } = require('express')
const fetchProfile = require('../controller/profile/fetchProfile')
const fetchReviews = require('../controller/profile/fetchReviews')
const payByDonor = require('../actions/post/payByDonor')
const profileRoute=Router()

//CRUD
profileRoute.get('/fetch-profile/:userId', fetchProfile)
profileRoute.get('/fetch-reviews', fetchReviews)

module.exports=profileRoute 