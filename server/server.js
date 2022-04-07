require('dotenv').config({path: "./config.env"});
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const errorHandler = require('./middleware/error_handler');
const ConnectDB = require('./database/whatsnextdb');

//Database connection
ConnectDB();

const app = express();
app.use(cors());
app.use(bodyParser.json());

//Routes
const user_routes = require('./routes/user_route');
const category_routes = require('./routes/category_route');
const questions_routes = require('./routes/questions_route');

//Routes middleware
app.use(user_routes);
app.use(category_routes);
app.use(questions_routes);

const PORT = process.env.PORT || 5000;

const server = app.listen(PORT , () => {
    console.log(`Server is running on ${PORT}`);
});

process.on("unhandledRejection", (err, promise) => {
    console.log(`Logged Error: ${err}`);
    server.close(() => process.exit(1));
});

const userRouter = require("./routes/user_input_routes");
app.use("/user",userRouter);

const problemRouter = require("./routes/problem_routes");
app.use("/problem",problemRouter);
app.use("/user-question",userRouter);
/**
 * Post routes (Dhananjaya)
 * */
const post = require('./routes/post_routes');
app.use("/posts",post);
