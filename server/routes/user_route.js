require('dotenv').config({path: "./config.env"});
const express = require("express");
const router = express.Router();
const crypto = require("crypto");
const userModel = require("../model/User");
const Error = require("../utils/error_response");
const { getPrivateData } = require("../middleware/private_error");
const { protect } = require("../middleware/user_protect");

//Protecion
router.get("/user", protect, getPrivateData);

//Register
router.post("/user/userregister", async (req, res, next) => {
  const {
    isAdmin,
    userEmail,
    userPassword,
  } = req.body;

  try {
    const user = await userModel.create({
      isAdmin,
      userEmail,
      userPassword,
    });

    user.save();
  } catch (error) {
    next(error);
  }
});

//Login
router.post("/user/userlogin", async (req, res, next) => {

  const { userEmail, userPassword, } = req.body;



  if (!userEmail || !userPassword ) {
    return next(new Error("Please provide an Email and Password...!", 400));
  }

  try {
    const user = await userModel.findOne({ userEmail }).select("+userPassword");

    if (!user) {
      return next(new Error("Invalid credentials...!", 401));
    }
    const isMatch = await user.matchPasswords(userPassword);

    if (!isMatch) {
      return next(new Error("Invalid Password...!", 401));
    }
    
    sendToken(user, 200, res);



  } catch (error) {
    next(error);
  }
});

//Retrive
router.get("/user/users", (req, res, next) => {
  userModel.find().exec((err, users) => {
    if (err) {
      return next(new Error("Can not find any user!", 400));
    }
    return res.status(200).json({
      success: true,
      users,
    });
  });
});

//Token send to the model class
const sendToken = (user, statusCode, res) => {
  const token = user.getSignedToken();
  res.status(statusCode).json({
    success: true,
    token,
  });
};

module.exports = router;
