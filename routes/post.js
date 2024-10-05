const { Router } = require('express')
const fetchAllPostRoute = require('../controller/post/fetchPostRoute')
const fetchPostById = require('../controller/post/fetchPostByIdCon')
const addPostCon = require('../controller/post/addPostCon')
const payByDonor = require('../controller/post/payByDonor')
const insertReviewCon = require('../controller/post/insertReviewCon')
const insertContributionCon = require('../controller/post/insertContributionCon')
const getPostComment = require('../controller/post/getPostComment')
const getPostPullReq = require('../controller/post/getPostPullReq')

const postRoute=Router()

//CRUD
postRoute.post('/add-post',addPostCon)
const insertPullReqCon = require('../controller/post/insertPullReqCon')

//CRUD  
postRoute.get('/fetch-all-post',fetchAllPostRoute)
postRoute.get('/fetch-post-by-id/:postId',fetchPostById)
postRoute.get('/fetch-post-comment/:postId',getPostComment)
postRoute.get('/fetch-post-pullReq/:postId',getPostPullReq)
postRoute.post('/donation-payment', payByDonor)
postRoute.post('/insert-review',insertReviewCon)
postRoute.post('/insert-contribution',insertContributionCon)
postRoute.post('/insert-pull-request',insertPullReqCon)


module.exports=postRoute