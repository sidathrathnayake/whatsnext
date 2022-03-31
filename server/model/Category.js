const mongoose = require('mongoose');

const CategorySchema = new mongoose.Schema({

    categoryName:{
        type:String,
        required: [true],
        unique: true
    },
});

module.exports = mongoose.model('categories', CategorySchema);