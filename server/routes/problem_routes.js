const router = require("express").Router();
const { response } = require("express");
const Problem = require("../models/problem_model");
const rn = require('random-number');

router.route("/add").post((req, res) => {

    var gen = rn.generator({
        min: 0000,
        max: 9999,
        integer: true
    })

    const id = 'PBM' + gen();
    const title = req.body.title;
    const link = req.body.link;
    let tags = req.body.tags;
    tags = tags.toString().split(",");
    const category = req.body.category;

    const newProblem = new Problem({
        id,
        title,
        link,
        tags,
        category,
    })
    newProblem.save().then(() => {
        res.status(200).send({ status: "New Problems Added", id, title, category });
    }).catch((err) => {
        console.log(err);
    })

})

router.route("/").get((req, res) => {
    Problem.find()
        .then((problem) => {
            res.status(200).send({ status: "Retreived all Problems", problem });
        })
        .catch((err) => {
            res.status(500).send({ status: "Problem retreive failed ", error: err.message });
        })
})

router.route("/get").get(async (req, res) => {
    const matchTag = []
    for (let i = 0; i < req.body.tags.length; i++) {
        let data = { "tags": req.body.tags[i] }
        matchTag.push(data);
    }

    const problem = await Problem.find({ $or: matchTag })
        .then((record) => {
            res.status(200).send({ status: "Retreived a Problem", record });
        }).catch((err) => {
            console.log(err.message);
            res.status(500).send({ status: "Problem retreive failed ", error: err.message });
        })
})

router.route("/update/:id").put(async (req, res) => {

    if (req.body && req.params) {
        const title = req.body.title;
        const link = req.body.link;
        let tags = req.body.tags;
        tags = tags.toString().split(",");
        const category = req.body.category;

        const updateProblem = {
            title,
            link,
            tags,
            category
        }

        await Problem.findOneAndUpdate({ "id": req.params.id }, updateProblem)
            .then(data => {
                res.status(200).send({ status: "Problems Updated", data });
            })
            .catch(error => {
                res.status(500).send({ status: "Problem update failed ", error: error.message });
            });
    }
})

router.route("/delete/:id").delete(async (req, res) => {
    let problemId = req.params.id;
    await Problem.findOneAndDelete({ "id": req.params.id })
        .then(() => {
            res.status(200).send({ status: "Problem Deleted" });
        }).catch((err) => {
            console.log(err.message);
            res.status(500).send({ status: "Problem delete failed ", error: err.message });
        })
})

module.exports = router;