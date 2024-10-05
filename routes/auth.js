const { Router } = require('express')
const registerUser = require('../controller/auth/createUser')
const loginUser = require('../controller/auth/validateUser')
const authRoute=Router()

//CRUD
authRoute.post('/register', registerUser)
authRoute.post('/loginUser', loginUser)

module.exports=authRoute 