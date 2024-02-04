// routes/categoryRoutes.js
const express = require('express');
const category_router = express.Router();
const categoryController = require('../controllers/category_controller.js');

// Define routes for categories
category_router.get('/categories', categoryController.getAllCategories);
category_router.get('/categories/:id', categoryController.getCategoryById);
category_router.post('/categories', categoryController.addCategory);
category_router.put('/categories/:id', categoryController.updateCategory);
category_router.delete('/categories/:id', categoryController.deleteCategory);

module.exports = category_router;
