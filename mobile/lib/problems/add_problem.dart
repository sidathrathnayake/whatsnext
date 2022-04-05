import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile/SignIn.dart';
import 'package:mobile/services/problem_service.dart';

class AddProblem extends StatefulWidget {
  const AddProblem({Key? key}) : super(key: key);

  @override
  _AddProblemState createState() => _AddProblemState();
}

Color textfieldcolor = Colors.black;

var problemTitle, problemLink, tags, category;

class _AddProblemState extends State<AddProblem> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // centerTitle: true,
        // leading: Icon(Icon.warning_amber,color: Colors.pink,size: 24.0,),
        title: const Text(
          'Add Problem',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Column(
            children: [
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center),
              ),
              Expanded(
                  child: Container(
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 55, 15, 25),
                          child: TextFormField(
                            controller:
                                TextEditingController(text: problemTitle),
                            onChanged: (value) {
                              problemTitle = value;
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: Image.asset("icons/title.png"),
                              labelText: "Problem Title",
                              labelStyle: TextStyle(
                                  fontSize: 16, color: textfieldcolor),
                              fillColor: Colors.black12,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
                          child: TextFormField(
                            controller:
                                TextEditingController(text: problemLink),
                            onChanged: (value) {
                              problemLink = value;
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: Image.asset("icons/link.png"),
                              labelText: "Problem Link",
                              labelStyle: TextStyle(
                                  fontSize: 16, color: textfieldcolor),
                              fillColor: Colors.black12,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
                          child: TextFormField(
                            controller: TextEditingController(text: tags),
                            onChanged: (value) {
                              tags = [value];
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: Image.asset("icons/tag.png"),
                              labelText: "Tags",
                              labelStyle: TextStyle(
                                  fontSize: 16, color: textfieldcolor),
                              fillColor: Colors.black12,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
                          child: TextFormField(
                            controller: TextEditingController(text: category),
                            onChanged: (value) {
                              category = value;
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon:
                                  Image.asset("icons/problemCategory.png"),
                              labelText: "Category",
                              labelStyle: TextStyle(
                                  fontSize: 16, color: textfieldcolor),
                              fillColor: Colors.black12,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 50, 15, 20),
                          child: Container(
                            height: 50,
                            width: 300,
                            child: RaisedButton(
                                color: Colors.teal,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Problems()
                                        .addProblem(problemTitle, problemLink,
                                            tags, category);
                                  } else {
                                    print("Error");
                                  }
                                },
                                child: Text(
                                  "Add Problem",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                )),
                          ),
                        ),
                      ],
                    )),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
