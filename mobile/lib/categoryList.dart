import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/categoryAdd.dart';
import 'package:mobile/categoryEdit.dart';
import 'package:mobile/services/service_categories.dart';
import 'package:mobile/variables/variables.dart';
import 'package:http/http.dart' as http;

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

ColorCodes colorCodes = new ColorCodes();

class _CategoryListState extends State<CategoryList> {
  // late List data;

  List categories = [];
  bool isLoading = false;

  getCategories() async {
    // var myUrl = "http://1.0.2.2:5000/category/categories";
    var myUrl = "http://localhost:5000/category/categories";

    var response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['categories'];
      //print(items);
      setState(() {
        categories = items;
      });
    } else {
      setState(() {
        categories = [];
      });
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'CATEGORY LIST',
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
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return getCard(categories[index]);
        });
  }

  Widget getCard(index) {
    var categoryName = index['categoryName'];

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            editCategory(index);
          },
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      categoryName.toString(),
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
                        deleteCategory(index);
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

  editCategory(index) {
    var id = index['_id'].toString();
    var categoryName = index['categoryName'].toString();
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) =>
                new CategoryEdit(id: id, categoryName: categoryName)));
  }

  deleteCategory(index) {
    var id = index['_id'].toString();
    Categories().categorydelete(id);
  }
}
