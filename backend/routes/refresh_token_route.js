// routes/userRoutes.js
const express = require('express');
const refreshRouter = express.Router();
const refreshController = require('../controllers/refresh_token_controller.js');

// Define routes for user token refresh
refreshRouter.post('/refresh', refreshController.refreshToken);

module.exports = refreshRouter;
