import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile/models/user_question_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/services/service_user_question_answer.dart';

class UserViewProfile extends StatefulWidget {
  const UserViewProfile({Key? key}) : super(key: key);

  @override
  State<UserViewProfile> createState() => _UserViewProfileState();
}

class _UserViewProfileState extends State<UserViewProfile> {
  // late Future<UserQuestion> futureAlbum;
  // List userQuestionAnswer = [];
  // bool isLoading = false;

  // getUserQuestionAnswer() async {
  //   // var myUrl = "http://1.0.2.2:5000/category/categories";
  //   var myUrl = "http://192.168.8.101:5000/user/get/a@gmail.com";

  //   var response = await http.get(Uri.parse(myUrl));
  //   if (response.statusCode == 200) {
  //     var items = json.decode(response.body);
  //     print(items);
  //     setState(() {
  //       userQuestionAnswer = items;
  //     });
  //   } else {
  //     setState(() {
  //       userQuestionAnswer = [];
  //     });
  //   }

  //   return json.decode(response.body);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   this.getUserQuestionAnswer();

  // }

  Future<List<UserQuestion>> fetchAlbum() async {
    // final response = await http
    //     .get(Uri.parse('http://192.168.8.101:5000/user/get/a@gmail.com'));

    // if (response.statusCode == 200) {
    //   // If the server did return a 200 OK response,
    //   // then parse the JSON.
    //   print(response.body);
    //   return UserQuestion.fromJson(jsonDecode(response.body));
    // } else {
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.
    //   throw Exception('Failed to load album');
    // }
    final url = Uri.parse("http://192.168.8.101:5000/user-question/get/b@gmail.com");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List listData = json.decode(response.body);
      return listData
          .map((listData) => new UserQuestion.fromJson(listData))
          .toList();
    } else {
      throw Exception("Error");
    }
  }

  Future delete(String id) async {
    await http.delete(
      Uri.parse('http://192.168.8.101:5000/user-question/delete/${id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
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
          "View Your Profile",
        ),
      ),
      body: FutureBuilder<List<UserQuestion>>(
          // future: listDataJSON(),
          future: fetchAlbum(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return new ListView.builder(
                  // itemCount: snapshot.data!.length,
                  itemCount: snapshot.data!.length,
                  // itemCount: 1,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (BuildContext context, int currentIndex) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                                  // color: Colors.teal.shade50,
                                  color: Colors.teal.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 50,
                              width: 200,
                              child: FlatButton(
                                  color: Colors.blue.shade600,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           EditInventory(
                                    //               update_inventory: snapshot
                                    //                   .data![currentIndex])),
                                    // );
                                  },
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white),
                                  )),
                            ),
                          ),
                          Positioned(
                            top: 90,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 50,
                              width: 200,
                              child: FlatButton(
                                  color: Colors.blue.shade600,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  onPressed: () => showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: Text(
                                              // snapshot.data![currentIndex].item_name,
                                              'Sports Category'),
                                          content: const Text(
                                              'Do you want to delete this? '),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              // onPressed: () =>
                                              //     //delete();
                                              //     Navigator.pop(context, 'OK'),
                                              onPressed: () {
                                                delete(snapshot
                                                    .data![currentIndex].id);
                                                Navigator.pop(context, 'OK');
                                              },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      ),
                                  child: Text(
                                    "Delete",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        // 'Sports Category',
                                        // snapshot.data!.categoryName,
                                        snapshot
                                            .data![currentIndex].categoryName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
