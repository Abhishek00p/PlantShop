// routes/plantRoutes.js
const express = require('express');
const plantRouter = express.Router();
const plantController = require('../controllers/plant_Controller.js');
const authenticateJWT = require('../middleware/auth_middleware.js');

// Define routes for plants
plantRouter.get('/plants',authenticateJWT, plantController.getAllPlants);
plantRouter.get('/plants/:id',authenticateJWT, plantController.getPlantById);
plantRouter.post('/addPlant',authenticateJWT, plantController.addPlant);
plantRouter.put('/plants/:id',authenticateJWT, plantController.updatePlant);
plantRouter.delete('/plants/:id',authenticateJWT, plantController.deletePlant);

module.exports = plantRouter;
