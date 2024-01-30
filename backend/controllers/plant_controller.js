
const Plant = require('../models/plant');
// Get all plants
exports.getAllPlants = async (req, res) => {
  try {
    const plants = await Plant.find();
    res.status(200).json(plants);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get a specific plant by ID
exports.getPlantById = async (req, res) => {
  try {
    const plant = await Plant.findById(req.params.id);
    if (!plant) {
      return res.status(404).json({ error: 'Plant not found' });
    }
    res.status(200).json(plant);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Add a new plant
exports.addPlant = async (req, res) => {
  try {
    const newPlant = await Plant.create(req.body);
    res.status(201).json(newPlant);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Update a plant by ID
exports.updatePlant = async (req, res) => {
  try {
    const updatedPlant = await Plant.findByIdAndUpdate(req.params.id, req.body, { new: true });
    if (!updatedPlant) {
      return res.status(404).json({ error: 'Plant not found' });
    }
    res.status(200).json(updatedPlant);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Delete a plant by ID
exports.deletePlant = async (req, res) => {
  try {
    const deletedPlant = await Plant.findByIdAndDelete(req.params.id);
    if (!deletedPlant) {
      return res.status(404).json({ error: 'Plant not found' });
    }
    res.status(200).json({ message: 'Plant deleted successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
