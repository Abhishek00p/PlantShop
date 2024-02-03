// routes/reviewRoutes.js
const express = require('express');
const router = express.Router();
const reviewController = require('../controllers/review_controller.js');

// Define routes for reviews
router.post('/reviews', reviewController.createReview);
router.get('/reviews', reviewController.getAllReviews);

module.exports = router;
