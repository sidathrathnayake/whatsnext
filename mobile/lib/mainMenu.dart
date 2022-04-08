import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/problems/problem_menu.dart';
import 'package:mobile/services/service_user.dart';
import 'package:mobile/userList.dart';
import 'package:mobile/variables/variables.dart';

import 'package:mobile/categoryList.dart';
import 'package:mobile/questionsList.dart';
import 'package:mobile/variables/variables.dart';

import 'navigational_drawer.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

ColorCodes colorCodes = new ColorCodes();

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {

    // User().asyncFunc();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavigationalDrawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'WhatsNext',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 30.0,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new UserList()));
                },
                child: Card(
                    color: Colors.teal,
                    child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "images/users.jpg",
                                  height: 120,
                                  width: 140,
                                  alignment: Alignment.topCenter,
                                )),
                            Text("USERS",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          ]),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new CategoryList()));
                },
              child: Card(
                  color: Colors.teal,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "images/categories.png",
                                height: 120,
                                width: 140,
                                alignment: Alignment.topCenter,
                              )),
                          Text("CATEGORIES",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ]),
                  ))),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new QuestionsList()));
                },
              child: Card(
                  color: Colors.teal,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "images/questions.jpg",
                                height: 120,
                                width: 140,
                                alignment: Alignment.topCenter,
                              )),
                          Text("QUESTIONS",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ]),
                  ))),
              Card(
                  color: Colors.teal,
                  child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              child: Image.asset("images/feeds.jpg",
                                  height: 120,
                                  width: 140,
                                  alignment: Alignment.topCenter)),
                          Text("FEEDS",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ]),
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ProblemMenu()));
                },
                child: Card(
                    color: Colors.teal,
                    child: Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.center,
                                child: Image.asset("images/problems.jpg",
                                    height: 120,
                                    width: 140,
                                    alignment: Alignment.topCenter)),
                            Text("PROBLEMS",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          ]),
                    )),
              )
            ]),
      ),
    );
  }
}
