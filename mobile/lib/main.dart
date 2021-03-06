// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/SignIn.dart';
import 'package:mobile/categoryEdit.dart';
import 'package:mobile/mainMenu.dart';
import 'package:mobile/problems/problem_menu.dart';
import 'package:mobile/problems/user_view_problem.dart';
import 'package:mobile/problems/view_problem.dart';
import 'package:mobile/questionsList.dart';
import 'package:mobile/categoryAdd.dart';
import 'package:mobile/categoryList.dart';
import 'package:mobile/questionsAdd.dart';
import 'package:mobile/signup.dart';
import 'package:mobile/userList.dart';
import 'package:mobile/user_feeds/AddPost.dart';
import 'package:mobile/user_feeds/comment_page.dart';
import 'package:mobile/user_feeds/post_page.dart';
import 'package:mobile/user_questions/user_answer_submit.dart';
import 'package:mobile/user_questions/user_select_category.dart';
import 'package:mobile/user_questions/user_view_profile.dart';
import 'package:mobile/problems/add_problem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "What's Next",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: SignUp(),
      // home: UserViewProblem(),
      // home: UserAnswerSubmit(),
      home: SignIn(),
      // home: MainMenu(),
      // home: UserSelectCategory(),
      // home: CategoryList(),
      // home: UserList(),
      // initialRoute: PostPage.routerName,
      //   routes: {
      //     PostPage.routerName : (context) => const PostPage(),
      //     AddPost.routerName : (context) => const AddPost(),
      //   },
    );
  }
}
