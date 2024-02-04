// routes/orderRoutes.js
const express = require('express');
const order_router = express.Router();
const orderController = require('../controllers/order_controller.js');

// Define routes for categories
order_router.get('/orders', orderController.getAllOrders);
order_router.get('/orders/:id', orderController.getOrderById);
order_router.post('/orders', orderController.createOrder);
order_router.put('/orders/:id', orderController.updateOrder);
order_router.delete('/orders/:id', orderController.deleteOrder);

module.exports = order_router;
