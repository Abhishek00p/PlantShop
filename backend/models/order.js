// models/order.js
const mongoose = require('mongoose');

const orderSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true,
  },
  plants: [
    {
      plant: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Plant',
        required: true,
      },
      quantity: {
        type: Number,
        required: true,
      },
    },
  ],
  totalAmount: {
    type: Number,
    required: true,
  },
  shippingAddress: String,
  orderStatus: {
    type: String,
    enum: ['Pending', 'Processing', 'Shipped', 'Delivered'],
    default: 'Pending',
  },
});

const Order = mongoose.model('Order', orderSchema);

module.exports = Order;
