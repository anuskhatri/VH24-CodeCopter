const { Router } = require('express')
const fetchAllPostRoute = require('../controller/post/fetchPostRoute')
const fetchPostById = require('../controller/post/fetchPostByIdCon')
const postRoute=Router()

//CRUD
postRoute.get('/fetch-all-post',fetchAllPostRoute)
postRoute.get('/fetch-post-by-id',fetchPostById)

module.exports=postRoute