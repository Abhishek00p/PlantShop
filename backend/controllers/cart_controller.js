// controllers/cartController.js
const Cart = require('../models/cart');

// Add items to the cart
exports.addToCart = async (req, res) => {
  const { userId, plantId, quantity } = req.body;

  try {
    let cart = await Cart.findOne({ user: userId });

    if (!cart) {
      // If the user doesn't have a cart, create a new one
      cart = await Cart.create({ user: userId, items: [{ plant: plantId, quantity }] });
    } else {
      // If the user already has a cart, update the existing one
      const existingItem = cart.items.find(item => item.plant.toString() === plantId);
      
      if (existingItem) {
        // If the plant is already in the cart, update the quantity
        existingItem.quantity += quantity;
      } else {
        // If the plant is not in the cart, add a new item
        cart.items.push({ plant: plantId, quantity });
      }

      await cart.save();
    }

    res.status(200).json(cart);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get the user's cart
exports.getCartByUserId = async (req, res) => {
  const userId = req.params.userId;

  try {
    const cart = await Cart.findOne({ user: userId }).populate('items.plant');

    if (!cart) {
      return res.status(404).json({ error: 'Cart not found' });
    }

    res.status(200).json(cart);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Clear the user's cart
exports.clearCart = async (req, res) => {
  const userId = req.params.userId;

  try {
    const cart = await Cart.findOneAndDelete({ user: userId });

    if (!cart) {
      return res.status(404).json({ error: 'Cart not found' });
    }

    res.status(200).json({ message: 'Cart cleared successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
