// This is the user input routes page/*importing roter package in express */
const router = require("express").Router();
const { response } = require("express");
/*importing model class  */
const User = require("../models/user_input_model");

router.route("/insert").post((req, res) => {
    const categoryName = req.body.categoryName;
    const userEmail = req.body.userEmail;
    const question_1 = req.body.question_1;
    const question_2 = req.body.question_2;
    const question_3 = req.body.question_3;
    const question_4 = req.body.question_4;
    const question_5 = req.body.question_5;

    const newProduct = new User({
        categoryName,
        userEmail,
        question_1,
        question_2,
        question_3,
        question_4,
        question_5,
    })
    newProduct.save().then(() => {
        res.json("User Questions Added")
        res.json(newProduct)
    }).catch((err) => {
        console.log(err);
    })

})

router.route("/get").get((req, res) => {
    User.find()
        .then((product) => {
            res.json(product)
        })
        .catch((err) => {
            res.json(err);
        })
})

router.route("/get/:userEmail").get(async (req, res) => {
    let userEmail = req.params.userEmail;

    // const user = await User.findOne({ userEmail })
    const user = await User.find({userEmail})
        .then((product) => {
            // res.status(200).send({ status: "User Fetched" });
            res.json(product)

        }).catch((err) => {
            console.log(err.message);
            // res.status(500).send({ status: "Error with getting the category", error: err.message });
            res.json(err);
        })
})

router.route("/update/:id").put(async (req, res) => {
    User.findOne({ "id": req.params.id })
        .then((cat) => {
            cat.question_1 = req.body.question_1;
            cat.question_2 = req.body.question_1;
            cat.question_3 = req.body.question_1;
            cat.question_4 = req.body.question_1;
            cat.question_5 = req.body.question_1;

            cat
                .save()
                .then(() => res.json("User Questions Updated!"))
                .catch((err) => res.status(400).json(`Error: ${err}`));
        })
        .catch((err) => res.status(400).json(`Error: ${err}`));
})

router.route("/delete/:id").delete(async (req, res) => {
    let userId = req.params.id;
    await User.findByIdAndDelete(userId)
        .then(() => {
            res.status(200).send({ status: "User Deleted" });
        }).catch((err) => {
            console.log(err.message);
            res.status(500).send({ status: "Error with delete user", error: err.message });
        })
})

module.exports = router;