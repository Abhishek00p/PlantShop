// routes/reviewRoutes.js
const express = require('express');
const router = express.Router();
const reviewController = require('../controllers/review_controller.js');
const authenticateJWT = require('../middleware/auth_middleware.js');

// Define routes for reviews
router.post('/reviews',authenticateJWT, reviewController.createReview);
router.get('/reviews',authenticateJWT, reviewController.getAllReviews);

module.exports = router;
