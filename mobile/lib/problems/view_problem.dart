import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/problems/add_problem.dart';
import 'package:mobile/problems/update_problem.dart';
import 'package:mobile/services/problem_service.dart';
import 'package:mobile/variables/variables.dart';
import 'package:http/http.dart' as http;

class ViewProblem extends StatefulWidget {
  const ViewProblem({Key? key}) : super(key: key);

  @override
  _ViewProblemState createState() => _ViewProblemState();
}

ColorCodes colorCodes = new ColorCodes();

class _ViewProblemState extends State<ViewProblem> {
  // late List data;

  List problems = [];
  bool isLoading = false;

  getProblems() async {
    var myUrl = "http://localhost:5000/problem/";

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
    return Scaffold(body: SingleChildScrollView(child: getBody()));
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
            child: Text(
              "VIEW PROBLEMS",
              style: TextStyle(
                  fontSize: 20, color: Colors.teal, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: problems.length,
              itemBuilder: (context, index) {
                return getCard(problems[index]);
              })
        ],
      ),
    );
  }

  Widget getCard(index) {
    var title = index['title'];
    var link = index['link'];
    var tags = index['tags'];
    var category = index['category'];

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 7, 5, 0),
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
                      "Title: " + title.toString(),
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: colorCodes.insideText, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 267,
                    child: Text(
                      "Web Link: " + link.toString(),
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: colorCodes.insideText, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 267,
                    child: Text(
                      "Tags: " + tags.toString(),
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: colorCodes.insideText, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 267,
                    child: Text(
                      "Category: " + category.toString(),
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: colorCodes.insideText, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      editProblem(index);
                    },
                    alignment: Alignment.topRight,
                    icon: Image.asset('icons/edit.png'),
                  ),
                  IconButton(
                    onPressed: () {
                      // deleteProblem(index);
                      deletePopUp(index);
                    },
                    icon: Image.asset('icons/delete.png'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> deletePopUp(index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Are you want to delete ' + index['title'] + ' ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Confirm"),
              onPressed: () {
                deleteProblem(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  editProblem(index) {
    print("edit");
    var id = index['id'].toString();
    var title = index['title'].toString();
    var link = index['link'].toString();
    var tags = index['tags'].toString();
    var category = index['category'].toString();
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new UpdateProblem(
                id: id,
                title: title,
                link: link,
                tags: tags,
                category: category)));
  }

  deleteProblem(index) {
    print("delete");
    var id = index['id'].toString();
    Problems().deleteProblem(id);
  }
}
