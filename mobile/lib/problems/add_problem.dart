import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
      // appBar: AppBar(
      //   elevation: 0,
      //   // centerTitle: true,
      //   // leading: Icon(Icon.warning_amber,color: Colors.pink,size: 24.0,),
      //   title: const Text(
      //     'Add Problem',
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      //   backgroundColor: Colors.cyan,
      // ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                          child: Text(
                            "ADD PROBLEM",
                            style: TextStyle(fontSize: 20, color: Colors.teal, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 40, 15, 25),
                          child: TextFormField(
                            controller:TextEditingController(text: null),
                            onChanged: (value) {
                              problemTitle = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter the Problem Title';
                              } else {
                                return null;
                              }
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
                                TextEditingController(text: null),
                            onChanged: (value) {
                              problemLink = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter the Problem Tags';
                              } else {
                                return null;
                              }
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
                          padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
                          child: TextFormField(
                            controller: TextEditingController(text: null),
                            onChanged: (value) {
                              tags = [value];
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter the Problem Tags';
                              } else {
                                return null;
                              }
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              helperText: "Seperate the tags using comma (,)",
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
                            controller: TextEditingController(text: null),
                            onChanged: (value) {
                              category = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter the Problem Category';
                              } else {
                                return null;
                              }
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
                                    var problemTags = tags;
                                    tags=null;
                                    Problems().addProblem(problemTitle,
                                        problemLink, problemTags, category);
                                        
                                  } else {
                                    print("Error");
                                  }
                                },
                                child: Text(
                                  "Confirm Add",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white),
                                )),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
