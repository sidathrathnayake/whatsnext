// This is the user input model class/*Importing mongoose*/
const mongoose = require('mongoose');

/*Importing schema package in mongoose*/
const Schema = mongoose.Schema;

/**Creating a researchPaper class with attributes*/
const userSubmission = new Schema({
    question_category: {
        type: String,
        required: true,
    },
    question_1: {
        type: Object,
        required: true,
    },
    question_2: {
        type: Object,
        required: true,
    },
    question_3: {
        type: Object,
        required: true,
    },
    question_4: {
        type: Object,
        required: true,
    },
    question_5: {
        type: Object,
        required: true,
    },
})

/**Creating a table in the database(model('researchPaper', researchPaper which was initialized above))*/
const userSubmissionModel = mongoose.model("user_details", userSubmission);

/**Exporting the AdminPay table */
module.exports = userSubmissionModel;