// controllers/userController.js
const User = require('../models/user');

require('dotenv/config');
const jwt = require('jsonwebtoken');



// Register a new user
exports.registerUser = async (req, res) => {
  try {
   const {username,email,password}=req.body
    if(!username){
      res.status(400).json({error:"Invalid username"})
    }
   else if(!email){
      res.status(400).json({error:"Invalid email"})
    }
    else if(!password){
      res.status(400).json({error:"Invalid password"})
    }
    const newUser = await User.create(req.body);
    res.status(201).json(newUser);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Login
exports.loginUser = async (req, res) => {
  const { email, password } = req.body;

  try {
    
    if (!email) {
      return res.status(401).json({ error: 'Invalid email' });
    }else if(!password){
      return res.status(401).json({ error: 'Invalid password' });

    }
    const user = await User.findOne({ email });
if(!user){
  return res.status(401).json({ error: 'user not found , Invalid Credential' });

}

    const isPasswordValid = await user.comparePassword(password);

    if (!isPasswordValid) {
      return res.status(401).json({ error: 'Invalid credentials' });
    } 
let userName = user.username;
    // Add your authentication logic here (e.g., JWT token generation)
    const token = jwt.sign({ userName }, "sdhsdsjjd754154547", { expiresIn: '10h' })
    res.status(200).json({ message: 'Login successful',"user":{"name":user.username,"email":user.email},"token":token });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Other user-related operations can be added similarly
