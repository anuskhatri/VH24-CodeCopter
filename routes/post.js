const { Router } = require('express')
const fetchAllPostRoute = require('../controller/post/fetchPostRoute')
const payByDonor = require('../controller/post/payByDonor')
const insertReviewCon = require('../controller/post/insertReviewCon')
const insertContributionCon = require('../controller/post/insertContributionCon')

const postRoute=Router()

//CRUD
postRoute.get('/fetch-all-post',fetchAllPostRoute)
postRoute.post('/donation-payment', payByDonor)
postRoute.post('/insert-review',insertReviewCon)
postRoute.post('/insert-contribution',insertContributionCon)


module.exports=postRoute