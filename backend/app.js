const express  = require('express');
const bodyParser = require('body-parser');


const plantRoutes = require('./routes/plant_route.js');
const userRoutes = require('./routes/user_route.js');
const orderRoutes = require('./routes/order_route.js');
const reviewRoutes = require('./routes/review_route.js');
const categoryRoutes = require('./routes/category_route.js');
const cartRoutes = require('./routes/cart_route.js');
const ConnectionDB = require('./mongo_connection.js');
// const myjson = require('config/app_config.json');
const app = express();
app.use(bodyParser.json());

app.use('/plant',plantRoutes);
app.use('/user',userRoutes);
app.use('/order',orderRoutes);
app.use('/review',reviewRoutes);
app.use('/cart',cartRoutes);
app.use('/category',categoryRoutes);

ConnectionDB();

app.use('/test',(req,res,next)=>{
  

    res.send({
        'health':'Good!!'
    });
    
});

app.listen(3000,()=>{
    console.log('app started listening');
});