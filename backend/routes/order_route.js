// app.js
const express = require('express');
const mongoose = require('mongoose');
const plantRoute = require('./plant_route.js');
const userRoute = require('./user_route.js');

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
app.use('/api', plantRoute);
app.use('/api/users', userRoute);

// Other middleware and setup can be added

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
