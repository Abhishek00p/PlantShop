const mongoose = require('mongoose');

const Schema = mongoose.Schema;


const plantSchema = new mongoose.Schema({
    name: {
      type: String,
      required: true,
    },
    description: {
      type:String,
      required:false,
    },
    price: {
      type: Number,
      required: true,
    },
    quantityInStock: {
      type: Number,
      required: true,
    },
    imageUrl: {
      type:String,
      required:false,
    },
    category: {
      type: String,
      enum: ['Indoor', 'Outdoor', 'Succulent', 'Herb', 'Flowering', 'Others'],
      required: true,
    },
    rating:{
      type:Number,
      default:0,
    }
  });
  
  const Plant = mongoose.model('Plant', plantSchema);
  
  module.exports = Plant;