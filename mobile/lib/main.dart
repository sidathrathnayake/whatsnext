import 'package:flutter/material.dart';
import 'package:mobile/signup.dart';
import 'package:mobile/user_questions/user_answer_submit.dart';

void main() {
  runApp(MyApp());
}

const seagreen = '#2e8b57';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "What's Next",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: SignUp(),
      home: UserAnswerSubmit(),
    );
  }
}
