const { Router } = require('express')
const fetchAllPostRoute = require('../controller/post/fetchPostRoute')
const postRoute=Router()

//CRUD
postRoute.get('/fetch-all-post',fetchAllPostRoute)

module.exports=postRoute