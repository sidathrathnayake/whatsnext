const mongoose = require('mongoose');

const QuestionSchema = new mongoose.Schema({

    questionBody:{
        type:String,
        unique: true,
        required: [true],
    },
    categoryName:{
        type:String,
        required: [true],
    },
    questionAnswers:{
        type:Array,
    }
});

module.exports = mongoose.model('questions', QuestionSchema);