// controllers/userController.js
const User = require('../models/user');

const jwt = require('jsonwebtoken');

exports.refreshToken= async(req,res)=>{
    const {email} =req.body;
try{
    console.log('email used for refreshing token :',email);
    const user = await User.findOne({ email });
if(user){
    const userName =user.username
    const token = jwt.sign({ userName }, "sdhsdsjjd754154547", { expiresIn: '10h' })

    res.status(200).json({ message: token });
}else{
    res.status(404).json({message:"invalid email"})
}
  

}catch(e){
    console.log('error found in refresh token : ',e)
res.status(500).json({message:"something went wrong "});
}
}
