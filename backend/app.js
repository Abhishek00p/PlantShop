const express  = require('express');
const mongoose  = require('mongoose');
const plantRoutes = require('./routes/plant_route.js');
const userRoutes = require('./routes/user_route.js');
const orderRoutes = require('./routes/order_route.js');
const reviewRoutes = require('./routes/review_route.js');
const categoryRoutes = require('./routes/category_route.js');
const cartRoutes = require('./routes/cart_route.js');
const fs = require('fs')
// const myjson = require('config/app_config.json');


const app = express();

const jsonPath ="config/app_config.json"

var configData="";

function getMongoDbUrlString(callBack){

    fs.readFile(jsonPath,'utf8',(err,data)=>{
        if(err){
            console.log("some error occured while reading config file :",err)
            callBack(err,null)
        }
        try {
            const fileData = JSON.parse(data)
            console.log('file read : ',fileData['mongodb'])
            configData=fileData;
            callBack( null,fileData['mongodb'])
        } catch (error) {
            console.error('error while parsing json ',error)
            callBack(error,null)
        }
    
    })
}
getMongoDbUrlString((err,result)=>{

    if(err){

    }else{
mongoose.connect(result).then(()=>{
    console.log('connected to MongoDB ');
    app.listen(3000);
    }
    ).then(()=>console.log('app started listening '))
    .catch((err)=>console.log('some error found while connecting or starting server : ',err));
    }
})

app.use('/test',(req,res,next)=>{
  

    res.send({
        'health':'Good!!'
    });
    
});

