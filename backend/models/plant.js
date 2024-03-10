const mongoose = require('mongoose');

const Schema = mongoose.Schema;


const plantSchema = new mongoose.Schema({
  // required fields
    name: {
      type: String,
      required: true,
    },
    price: {
      type: Number,
      required: true,
    },
    quantityInStock: {
      type: Number,
      required: true,
    },
    category: {
      type: String,
      enum: ['Indoor', 'Outdoor', 'Succulent', 'Herb', 'Flowering', 'Others'],
      required: true,
    },

    // not required feilds
    description: {
      type:String,
      required:false,
    },

    imageUrl: {
      type:String,
      required:false,
    },
   
    rating:{
      type:Number,
      default:0,
    }
  });
  
  const Plant = mongoose.model('Plant', plantSchema);
  
  module.exports = Plant;