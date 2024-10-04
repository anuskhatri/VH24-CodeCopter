const { Router } = require('express')
const fetchAllPostRoute = require('../controller/post/fetchPostRoute')
const insertReviewCon = require('../controller/post/insertReviewCon')
const insertContributionCon = require('../controller/post/insertContributionCon')

const postRoute=Router()

//CRUD
postRoute.get('/fetch-all-post',fetchAllPostRoute)
postRoute.post('/insert-review',insertReviewCon)
postRoute.post('/insert-contribution',insertContributionCon)


module.exports=postRoute