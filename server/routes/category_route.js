require('dotenv').config({path: "./config.env"});
const express = require("express");
const router = express.Router();
const categoryModel = require("../model/Category");
const Error = require("../utils/error_response");


//Register
router.post("/category/categoryadd", async (req, res, next) => {
  const {
    categoryName,
  } = req.body;

  try {
    const category = await categoryModel.create({
        categoryName,
    });
    category.save;
    return res.status(200).json({
      success:'Succussfully updated.'
  });
  } catch (error) {
    next(error);
  }
});

//Retrive
router.get("/category/categories", (req, res, next) => {
  categoryModel.find().exec((err, categories) => {
    if (err) {
      return next(new Error("Can not find any category!", 400));
    }
    return res.status(200).json({
      success: true,
      categories,
    });
  });
});

// Retrive specific data by name
router.get('/category/categorydata/:categoryName',(req,res) =>{
    const categoryName = req.params.categoryName;
    categoryModel.findOne(categoryName,(err, category) => {
        if(err){
            return next(new Error("Can not find a category with this category name...!",400));
        }
        return res.status(200).json({
            success:true,
            category
        });
    })
})

//Update
router.put('/category/updatecategory/:id', (req, res, next) => {
    
    categoryModel.findByIdAndUpdate(req.params.id, {
        $set:req.body
    },
    (err, category) => {
        if(err){
            return next(new Error('Can not update the data!', 400));
        }
        
        return res.status(200).json({
            success:'Succussfully updated.'
        });
    });
});

//Delete
router.delete('/category/deletecategory/:id', (req, res, next) => {
    categoryModel.findByIdAndRemove(req.params.id).exec((err, deletecategory) => {
        if(err){
            return next(new Error('Can not delete the data', 400));
        }
        return res.status(200).json({
            success:[true, " Deleted successfully!"],
            deletecategory
        });
    }); 
});

module.exports = router;
