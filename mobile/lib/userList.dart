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
  List users = [];
  bool isLoading = false;

  getUsers() async {
    var myUrl = "http://localhost:5000/user/users";

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
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
        child: ElevatedButton(
          onPressed: () {
          },
          child: ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        // deleteUser(index);
                        deletePopUp(index);
                      },
                      icon: Image.asset('icons/delete.png'),
                    ),
                  ],
                )
              ],
            ),
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
                Text('Are you want to delete ' + index['userEmail'] + ' ?'),
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
                deleteUser(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  deleteUser(index) {
    print("delete");
    var id = index['_id'].toString();
    User().deleteUser(id);
  }

} 
