const express  = require('express');
const mongoose  = require('mongoose');
const plantRoutes = require('./routes/plantRoutes');
const userRoutes = require('./routes/userRoutes');
const orderRoutes = require('./routes/orderRoutes');
const reviewRoutes = require('./routes/reviewRoutes');
const categoryRoutes = require('./routes/categoryRoutes');
const cartRoutes = require('./routes/cartRoutes');



const app = express();


mongoose.connect('mongodb+srv://prajapatabhishek9326:r5wWJF9v9XwUWqPU@cluster0.gkxnzd8.mongodb.net/?retryWrites=true&w=majority').then(()=>{
console.log('connected to MongoDB ');
app.listen(3000);
}
).then(()=>console.log('app started listening '))
.catch((err)=>console.log('some error found while connecting or starting server : ',err));

app.use('/test',(req,res,next)=>{
  

    res.send({
        'health':'Good!!'
    });
    
});

