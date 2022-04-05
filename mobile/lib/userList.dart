import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/categoryAdd.dart';
import 'package:mobile/categoryEdit.dart';
import 'package:mobile/services/service_categories.dart';
import 'package:mobile/services/service_user.dart';
import 'package:mobile/variables/variables.dart';
import 'package:http/http.dart' as http;

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

ColorCodes colorCodes = new ColorCodes();

class _UserListState extends State<UserList> {
  // late List data;

  List users = [];
  bool isLoading = false;

  getUsers() async {
    // var myUrl = "http://1.0.2.2:5000/category/categories";
    var myUrl = "http://192.168.8.101:5000/user/users";

    var response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['users'];
      //print(items);
      setState(() {
        users = items;
      });
    } else {
      setState(() {
        users = [];
      });
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'USER LIST',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new CategoryAdd()));
              },
              icon: Image.asset('icons/add.png'),
            )
          ],
        ),
        body: getBody());
  }

  Widget getBody() {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }

  Widget getCard(index) {
    var userEmail = index['userEmail'];

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // editCategory(index);
          },
          child: ListTile(
            title: Row(
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      userEmail.toString(),
                      style: TextStyle(
                          color: colorCodes.insideText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    print(deleteUser(index));
                    // deleteUser(index);
                  },
                  icon: Image.asset('icons/delete.png'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // editCategory(index) {
  //   var id = index['_id'].toString();
  //   var categoryName = index['categoryName'].toString();
  //   Navigator.push(
  //       context,
  //       new MaterialPageRoute(
  //           builder: (context) =>
  //               new CategoryEdit(id: id, categoryName: categoryName)));
  // }

  deleteUser(index) {
    var id = index['_id'].toString();
    User().deleteUser(id);
  }
}
