const express = require('express');
const router = express.Router();
const Post = require('../models/Post.model');
const Comment = require('../models/Comment.model');

/**
 * Using this function, a new post can be added
 * */
router.route('/add-post').post(async (req, res) =>{
    let post = {
        userID:req.body.userID,
        post:req.body.post
    }

    const newPost = new Post(post);

    try{
        await newPost.save().then(data =>{
           res.status(201).send({
               success:true,
               message:"New post has been add !"
           })
        });
    }catch (error) {
        res.status(500).send({
            success:false,
            message:error.message
        })
    }
});

/**
 * This is used to delete a post and its comments by post id
 * */
router.route('/delete-post/:id').delete(async (req, res) =>{
    try{
        await Post.findByIdAndDelete({_id:req.params.id}).then(data =>{
            res.status(200).send({
                success:true,
                message:'The post has been deleted successfully !'
            })
        })
    }catch (error){
        res.status(500).send({
            success:false,
            message:error.message
        })
    }
});

/**
 * This function is used to add comment to a post by post id
 * */
router.route('/add-comment').post(async (req, res) =>{
    let commentData = {
        postID:req.body.postID,
        userID:req.body.userID,
        userName:req.body.userName,
        message:req.body.message
    }
    console.log(commentData);
    const newComment = new Comment(commentData);
    try {
        await newComment.save()
            .then(data =>{
                res.status(201).send({
                    success:true,
                    message:'Comment saved successfully !'
                })
            })
    }catch (error){
        res.status(500).send({
            success:false,
            message:error.message
        })
    }
});

/**
 * This function is handling the comment update functionality by post is and comment id
 * */
router.route('/update-comment/:id').put(async (req, res) =>{
    try{
        await Comment.findByIdAndUpdate({_id:req.params.id},{$set:{message:req.body.message}}
        ).then(data =>{
            res.status(200).send({
                data:data,
                success:true,
                message:'Comment updated successfully !'
            })
        })
    }catch (error) {
        res.status(500).send({
            success:false,
            message:error.message
        })
    }
})

/**
 * Delete a comment by comment id
 * */
router.route('/delete-comment/:id').delete(async (req, res) =>{
    try{
        await Comment.findByIdAndDelete({_id:req.params.id}
        ).then(data =>{
                res.status(200).send({
                    data:data,
                    success:true,
                    message:"Comment has been delete successfully !"
                })
            })
    }catch (error) {
        res.status(500).send({
            success:false,
            message:error.message
        })
    }
})

/**
 * Get all posts
 * */
router.route('/get-all-posts').get(async (req, res) =>{
    try {
        await Post.aggregate([{$sort:{_id:-1}}]).then(data =>{
            res.status(200).send({
                success:true,
                data:data,
            })
        })
    }catch (error){
        res.status(500).send({
            success:false,
            message:error.message
        })
    }
})

/**
 * Get all comments for given post id
 * */
router.route('/get-all-comments/:id').get(async (req, res) =>{
    console.log(req.params.id);
    try {
        await Comment.find({postID:req.params.id}).then(data =>{
            res.status(200).send({
                success:true,
                data:data,
            })
        })
    }catch (error){
        res.status(500).send({
            success:false,
            message:error.message
        })
    }
})

module.exports = router;