// routes/userRoutes.js
const express = require('express');
const router = express.Router();
const userController = require('../controllers/user_controller.js');

// Define routes for users
router.post('/register', userController.registerUser);
router.post('/login', userController.loginUser);

module.exports = router;
