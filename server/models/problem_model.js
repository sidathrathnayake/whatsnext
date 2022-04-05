const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const problem = new Schema({
    id: {
        type: String,
        required: true,
        unique: true,
    },
    title: {
        type: String,
        required: true,
    },
    link: {
        type: String,
        required: true,
    },
    tags: {
        type: Array,
        required: true,
    },
    category: {
        type: String,
        required: true,
    },
})

const problemModel = mongoose.model("problem_details", problem);
module.exports = problemModel;