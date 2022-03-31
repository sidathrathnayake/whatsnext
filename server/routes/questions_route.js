require('dotenv').config({path: "./config.env"});
const express = require("express");
const router = express.Router();
const questionModel = require("../model/Questions");
const Error = require("../utils/error_response");


//Register
router.post("/question/questionadd", async (req, res, next) => {
  const {
    questionBody,
    categoryName,
    questionAnswers
  } = req.body;

  try {
    const question = await questionModel.create({
      questionBody,
      categoryName,
      questionAnswers
    });

    question.save();
  } catch (error) {
    next(error);
  }
});

//Retrive
router.get("/question/questions", (req, res, next) => {
  questionModel.find().exec((err, questions) => {
    if (err) {
      return next(new Error("Can not find any question!", 400));
    }
    return res.status(200).json({
      success: true,
      questions,
    });
  });
});

// Retrive specific data by name
router.get('/question/questiondata/:questionBody',(req,res) =>{
    const questionBody = req.params.questionName;
    questionModel.findOne(questionBody,(err, question) => {
        if(err){
            return next(new Error("Can not find a question with this body...!",400));
        }
        return res.status(200).json({
            success:true,
            question
        });
    })
})

//Update
router.put('/question/updatequestion/:id', (req, res, next) => {
    
    questionModel.findByIdAndUpdate(req.params.id, {
        $set:req.body
    },
    (err, question) => {
        if(err){
            return next(new Error('Can not update the data!', 400));
        }
        
        return res.status(200).json({
            success:'Succussfully updated.'
        });
    });
});

//Delete
router.delete('/question/deletequestion/:id', (req, res, next) => {
    questionModel.findByIdAndRemove(req.params.id).exec((err, deletequestion) => {
        if(err){
            return next(new Error('Can not delete the data', 400));
        }
        return res.status(200).json({
            success:[true, " Deleted successfully!"],
            deletequestion
        });
    }); 
});

module.exports = router;
