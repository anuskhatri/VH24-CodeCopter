const { Router } = require('express')
const fetchAllPostRoute = require('../controller/post/fetchPostRoute')
const fetchPostById = require('../controller/post/fetchPostByIdCon')
const addPostCon = require('../controller/post/addPostCon')
const fetchPostComments = require('../actions/post/fetchPostCOmment')
const postRoute=Router()

//CRUD
postRoute.post('/add-post',addPostCon)
postRoute.get('/fetch-all-post',fetchAllPostRoute)
postRoute.get('/fetch-post-by-id/:postId',fetchPostById)
postRoute.get('/fetch-post-comment/:postId',fetchPostComments)

module.exports=postRoute