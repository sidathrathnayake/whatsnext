import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/services/problem_service.dart';

class UpdateProblem extends StatefulWidget {
  var id, title, link, tags, category;
  UpdateProblem({
    this.id,
    this.title,
    this.link,
    this.tags,
    this.category,
    Key? key,
  }) : super(key: key);

  @override
  _UpdateProblemState createState() => _UpdateProblemState();
}

Color textfieldcolor = Colors.black;

var id, problemTitle, problemLink, tags, category;

class _UpdateProblemState extends State<UpdateProblem> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    setState(() {
      id = widget.id;
      problemTitle = widget.title;
      problemLink = widget.link;
      tags = widget.tags.replaceAll(new RegExp('[\\[\\]]'),'');
      category = widget.category;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Update Problem',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,

          ),
        ),
        backgroundColor: Colors.teal,
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
                          padding: const EdgeInsets.fromLTRB(15, 50, 15, 25),
                          child: TextFormField(
                            controller: TextEditingController(text: id),
                            readOnly: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: Image.asset("icons/id.png"),
                              labelText: "Problem ID",
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
                            controller: TextEditingController(text: problemTitle),
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
                            controller: TextEditingController(text: problemLink),
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
                              tags = value;
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
                              prefixIcon: Image.asset("icons/problemCategory.png"),
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
                                  updateProblem(id,problemTitle,problemLink,tags,category);
                                },
                                child: Text(
                                  "Update Problem",
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

  updateProblem(id,problemTitle,problemLink,tags,category) {
    var trimTags =[tags.replaceAll(new RegExp('\\s+'),'')];
    Problems().updateProblem(id,problemTitle,problemLink,trimTags,category);
  }
}
