const crypto = require('crypto');
const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const userSchema = new mongoose.Schema({

    isAdmin:{
        type:Boolean,
        default: 0,
    },
    userEmail:{
        type:String,
        required: [true, 'Email field can not be empty!'],
        unique:true,
        match:[
            /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
            "Invalid email.Please provide a valid email",
        ]
    },
    userPassword:{
        type:String,
        required: [true]
    },
});

userSchema.pre("save", async function(next){
    if(!this.isModified("userPassword")){
        next();
    }

    const salt = await bcrypt.genSalt(10);
    this.userPassword = await bcrypt.hash(this.userPassword, salt);
    next();

});

userSchema.methods.matchPasswords = async function(userPassword){
    return await bcrypt.compare(userPassword, this.userPassword);  
}

userSchema.methods.getSignedToken = function(){
    return jwt.sign(
        {id: this._id},
        process.env.JWT_SECRET,
        { expiresIn: process.env.JWT_EXPIRE, }
        );
};

module.exports = mongoose.model('users', userSchema);