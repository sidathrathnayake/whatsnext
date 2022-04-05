import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/problems/add_problem.dart';
import 'package:mobile/problems/update_problem.dart';
import 'package:mobile/services/problem_service.dart';
import 'package:mobile/variables/variables.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class UserViewProblem extends StatefulWidget {
  const UserViewProblem({Key? key}) : super(key: key);

  @override
  _UserViewProblemState createState() => _UserViewProblemState();
}

ColorCodes colorCodes = new ColorCodes();

class _UserViewProblemState extends State<UserViewProblem> {
  // late List data;

  List problems = [];
  bool isLoading = false;

  getProblems() async {
    var myUrl = "http://192.168.1.101:5000/problem/";

    var response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['problem'];
      // print(items);
      setState(() {
        problems = items;
      });
    } else {
      setState(() {
        problems = [];
      });
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getProblems();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'PROBLEM LIST',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: getBody());
  }

  Widget getBody() {
    return ListView.builder(
        itemCount: problems.length,
        itemBuilder: (context, index) {
          return getCard(problems[index]);
        });
  }

  Widget getCard(index) {
    var title = index['title'];
    var link = index['link'];
    var tags = index['tags'];
    var category = index['category'];

    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 7, 5, 0),
        child: GestureDetector(
          onTap: () async {
            var url = index['link'];
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Card(
            color: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 267,
                        child: Text(
                          title.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                              color: colorCodes.insideText, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
