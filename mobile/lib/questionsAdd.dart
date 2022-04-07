import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/questionsList.dart';
import 'package:mobile/services/service_questions.dart';
import 'package:mobile/variables/variables.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class QuestionsAdd extends StatefulWidget {
  const QuestionsAdd({Key? key}) : super(key: key);

  @override
  _QuestionsAddState createState() => _QuestionsAddState();
}

ColorCodes colorCodes = new ColorCodes();

// ignore: deprecated_member_use

var categoryName, questionBody, questionAnswers;

class _QuestionsAddState extends State<QuestionsAdd> {
  late int count;
  String? selectCategory;
  List categories = [];
  String? questionAnswersList;
  late List<Map<String, dynamic>> answerValues;

  getCategories() async {
    var myUrl = "http://10.0.2.2:5000/category/categories";

    var response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['categories'];
      print(items);
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
    count = 0;
    questionAnswersList = '';
    answerValues = [];
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'ADD QUESTIONS',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                setState(() {
                  count++;
                });
              },
              icon: Icon(Icons.add))
        ],
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
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                              height: size.height / 3,
                              width: size.width,
                              child: Image.asset("images/question.png")),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller:
                                TextEditingController(text: questionBody),
                            onChanged: (value) {
                              questionBody = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter question';
                              } else {
                                return null;
                              }
                            },
                            style: TextStyle(color: colorCodes.textFieldColor),
                            decoration: InputDecoration(
                              prefixIcon: Image.asset("icons/question.png"),
                              labelText: "Question",
                              labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: colorCodes.textFieldColor),
                              fillColor: colorCodes.fillColor,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: colorCodes.focusBorder,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: colorCodes.errorBorder,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: colorCodes.errorBorder,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: colorCodes.fillColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: DropdownButton(
                                  itemHeight: 60,
                                  isExpanded: true,
                                  hint: Text(
                                    'Select Category',
                                    style: TextStyle(
                                        color: colorCodes.textFieldColor,
                                        fontSize: 16),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      selectCategory = value as String?;
                                    });
                                  },
                                  value: selectCategory,
                                  items: categories.map((category) {
                                    return DropdownMenuItem(
                                        value: category['categoryName'],
                                        child: Text(category['categoryName']));
                                  }).toList()),
                            ),
                          ),
                        ),
                        Flexible(
                            child: new ListView.builder(
                                shrinkWrap: true,
                                itemCount: count,
                                itemBuilder: (context, index) {
                                  return row(index);
                                })),
                        //Text(questionAnswersList!),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Container(
                            height: 60,
                            width: 400,
                            child: FlatButton(
                                color: colorCodes.focusBorder,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Questions()
                                        .questionadd(questionBody,
                                            selectCategory, questionAnswersList)
                                        .then((val) async {
                                      if (val.data['success']) {
                                        Fluttertoast.showToast(
                                            msg: "Added Successfully",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                                colorCodes.toastSuccess,
                                            textColor: colorCodes.insideText,
                                            fontSize: 16.0);
                                      } else {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Something went wrong please try again!",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                                colorCodes.toastError,
                                            textColor: colorCodes.insideText,
                                            fontSize: 16.0);
                                      }
                                    });
                                  } else {
                                    print("Error");
                                  }
                                },
                                child: Text(
                                  "ADD",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: colorCodes.insideText),
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

  row(int key) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onChanged: (value) {
                onUpdate(key, value);
                questionAnswers = value.toString();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter answers';
                } else {
                  return null;
                }
              },
              style: TextStyle(color: colorCodes.textFieldColor),
              decoration: InputDecoration(
                prefixIcon: Image.asset("icons/answers.png"),
                labelText: "Answers",
                labelStyle:
                    TextStyle(fontSize: 16, color: colorCodes.textFieldColor),
                fillColor: colorCodes.fillColor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: colorCodes.focusBorder,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: colorCodes.errorBorder,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: colorCodes.errorBorder,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  onUpdate(int key, String value) {
    int foundKey = -1;
    for (var map in answerValues) {
      if (map.containsKey('id')) {
        if (map['id'] == key) {
          foundKey = key;
          break;
        }
      }
      if (-1 != foundKey) {
        answerValues.removeWhere((map) {
          return map['id'] == foundKey;
        });
      }
    }
    Map<String, dynamic> json = {'value': value};

    answerValues.add(json);


    setState(() {
      questionAnswersList = answerValues.toString();
    });
  }
}
