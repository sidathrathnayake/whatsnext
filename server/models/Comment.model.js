const mongoose = require('mongoose');

const commentSchema = new mongoose.Schema({
    postID:{
        type:mongoose.Schema.Types.ObjectId,
        required:true,
        ref:"Posts"
    },
    userID:{
        type:mongoose.Schema.Types.ObjectId,
        required:true,
        ref:"Users"
    },
    userName:{
        type:String,
        required:true,
    },
    message:{
        type:String
    }
})

const Comment = mongoose.model('Comments', commentSchema);
module.exports = Comment;