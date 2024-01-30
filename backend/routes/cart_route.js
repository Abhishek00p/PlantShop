// routes/cartRoutes.js
const express = require('express');
const router = express.Router();
const cartController = require('../controllers/cartController');

// Define routes for carts
router.post('/carts', cartController.addToCart);
router.get('/carts/:userId', cartController.getCartByUserId);
router.delete('/carts/:userId', cartController.clearCart);

module.exports = router;
