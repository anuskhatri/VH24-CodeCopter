const { Router } = require('express')
const fetchAllPostRoute = require('../controller/post/fetchPostRoute')
const payByDonor = require('../controller/post/payByDonor')
const postRoute=Router()

//CRUD
postRoute.get('/fetch-all-post',fetchAllPostRoute)
postRoute.post('/donation-payment', payByDonor)

module.exports=postRoute