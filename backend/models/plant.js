const mongoose = require('mongoose');

const Schema = mongoose.Schema;


const plantSchema = new mongoose.Schema({
    name: {
      type: String,
      required: true,
    },
    description: String,
    price: {
      type: Number,
      required: true,
    },
    quantityInStock: {
      type: Number,
      required: true,
    },
    imageUrl: String,
    category: {
      type: String,
      enum: ['Indoor', 'Outdoor', 'Succulent', 'Herb', 'Flowering', 'Others'],
      required: true,
    },
  });
  
  const Plant = mongoose.model('Plant', plantSchema);
  
  module.exports = Plant;