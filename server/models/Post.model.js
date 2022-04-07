const mongoose = require('mongoose');

const PostSchema = new mongoose.Schema({

    userID:{
        type:mongoose.Schema.Types.ObjectId,
        required:true,
        ref:"mobileUsers"
    },
    post:{
        type:String,
        required:true
    },
})

const Post = mongoose.model('Posts', PostSchema);
module.exports = Post;