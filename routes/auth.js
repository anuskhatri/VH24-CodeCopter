const { Router } = require('express')
const registerUser = require('../controller/auth/createUser')
const loginUser = require('../controller/auth/validateUser')
const verifyOtp = require('../actions/supplierAuth/veryOTP')
const orderToSupplier = require('../actions/supplierAuth/orderToSupplier')
const authRoute=Router()

//CRUD
authRoute.post('/register', registerUser)
authRoute.post('/loginUser', loginUser)
authRoute.post('/verifyOtp', verifyOtp)
authRoute.post('/sendOtp', orderToSupplier)

module.exports=authRoute 