const mongoose = require('mongoose');

require('dotenv/config');

const mongoUrl = process.env.mongoDbUrl;

const ConnectionDB = async() => {
    mongoose.set("strictQuery", false);

    mongoose.connect(mongoUrl).then(() => {
        console.log('connected to MongoDB ');
    }
    )
        .catch((err) => console.log('some error found while connecting or starting server : ', err));

}

module.exports = ConnectionDB;
