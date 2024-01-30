// app.js
const express = require('express');
const mongoose = require('mongoose');
const plantRoutes = require('./routes/plantRoutes');
const userRoutes = require('./routes/userRoutes');

const app = express();

// Connect to MongoDB
mongoose.connect('mongodb://localhost:27017/plantshop', { useNewUrlParser: true, useUnifiedTopology: true });

// Check for connection errors
mongoose.connection.on('error', (err) => {
  console.error('MongoDB connection error:', err);
});

// Check for successful connection
mongoose.connection.once('open', () => {
  console.log('Connected to MongoDB');
});

// Middleware to parse JSON in request bodies
app.use(express.json());

// Use routes
app.use('/api', plantRoutes);
app.use('/api/users', userRoutes);

// Other middleware and setup can be added

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
