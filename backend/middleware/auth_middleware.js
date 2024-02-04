const jwt = require('jsonwebtoken');

require('dotenv/config');

// authenticate user

const authenticateJWT = (req, res, next) => {
    const token = req.headers.authorization;
    if(!token){
  
      return res.status(401).json({ error: 'Unauthorized' });
    }else{
       var refinedToken = token.toString().replace('Bearer','');
      jwt.verify(refinedToken.trim(),"sdhsdsjjd754154547",(err,user)=>{

        if(err){
            console.log(err);
          res.status(403).json({"error":"You are not allowed to make Request"})
        }else{
          next()
        }
      })
    }
  }

  module.exports=authenticateJWT;