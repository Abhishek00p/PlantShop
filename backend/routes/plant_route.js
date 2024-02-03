// routes/plantRoutes.js
const express = require('express');
const plantRouter = express.Router();
const plantController = require('../controllers/plant_Controller.js');

// Define routes for plants
plantRouter.get('/plants', plantController.getAllPlants);
plantRouter.get('/plants/:id', plantController.getPlantById);
plantRouter.post('/plants', plantController.addPlant);
plantRouter.put('/plants/:id', plantController.updatePlant);
plantRouter.delete('/plants/:id', plantController.deletePlant);

module.exports = plantRouter;
