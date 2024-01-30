// routes/plantRoutes.js
const express = require('express');
const router = express.Router();
const plantController = require('../controllers/plantController');

// Define routes for plants
router.get('/plants', plantController.getAllPlants);
router.get('/plants/:id', plantController.getPlantById);
router.post('/plants', plantController.addPlant);
router.put('/plants/:id', plantController.updatePlant);
router.delete('/plants/:id', plantController.deletePlant);

module.exports = router;
