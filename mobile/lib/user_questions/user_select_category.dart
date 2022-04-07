import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:mobile/models/user_category_model.dart';
import 'package:mobile/models/user_question_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/problems/user_view_problem.dart';
import 'package:mobile/user_questions/edit_user_answer_submit.dart';
import 'package:mobile/user_questions/user_answer_submit.dart';

class UserSelectCategory extends StatefulWidget {
  const UserSelectCategory({Key? key}) : super(key: key);

  @override
  State<UserSelectCategory> createState() => _UserSelectCategoryState();
}

class _UserSelectCategoryState extends State<UserSelectCategory> {
  var email;

  Future<List<UserCategory>> fetchAlbum() async {
    final url = Uri.parse("http://localhost:5000/category/categories");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List listData = json.decode(response.body)['categories'];
      print(listData);
      return listData
          .map((listData) => new UserCategory.fromJson(listData))
          .toList();
    } else {
      throw Exception("Error");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Select Preferred Category",
        ),
      ),
      body: FutureBuilder<List<UserCategory>>(
          future: fetchAlbum(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return new ListView.builder(
                  itemCount: snapshot.data!.length,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (BuildContext context, int currentIndex) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          height: 160,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Container(
                                height: 136,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.teal,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 15),
                                        blurRadius: 27,
                                        color: Colors.black12)
                                  ],
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.teal.shade200,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              Positioned(
                                top: 75,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  height: 40,
                                  width: 150,
                                  child: FlatButton(
                                      color: Colors.teal,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    new UserAnswerSubmit(
                                                      categoryName: snapshot
                                                          .data![currentIndex]
                                                          .categoryName,
                                                    )));
                                      },
                                      child: Text(
                                        "Select",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white),
                                      )),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: SizedBox(
                                    height: 136,
                                    width: size.width - 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Text(
                                            snapshot.data![currentIndex]
                                                .categoryName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            }
          }),
    );
  }
}

selectInput(val, context) {}
