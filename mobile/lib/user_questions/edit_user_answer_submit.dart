import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/SignIn.dart';
import 'package:mobile/services/service_user_question_answer.dart';
import 'package:http/http.dart' as http;

class EditUserAnswerSubmit extends StatefulWidget {
  var id;
  var categoryName;
  var userEmail;
  var question_1;
  var question_2;
  var question_3;
  var question_4;
  var question_5;
  EditUserAnswerSubmit({
    this.id,
    this.categoryName,
    this.userEmail,
    this.question_1,
    this.question_2,
    this.question_3,
    this.question_4,
    this.question_5,
    Key? key,
  }) : super(key: key);

  @override
  _EditUserAnswerSubmitState createState() => _EditUserAnswerSubmitState();
}

Color textfieldcolor = Colors.black;

var userEmail, userPassword, userConfirmPassword;

class _EditUserAnswerSubmitState extends State<EditUserAnswerSubmit> {
  final _formKey = GlobalKey<FormState>();

  List questionAnswers = [];

  var categoryName = 'Sports',
      userEmail = 'a@gmail.com',
      question_1,
      question_2,
      question_3,
      question_4,
      question_5;

  List question_answers_01 = ['answer 1', 'answer 2'];
  List question_answers_02 = ['answer 1', 'answer 2'];
  List question_answers_03 = ['answer 1', 'answer 2'];
  List question_answers_04 = ['answer 1', 'answer 2'];
  List question_answers_05 = ['answer 1', 'answer 2'];

  String? selectQuestion01Type;
  String? selectQuestion02Type;
  String? selectQuestion03Type;
  String? selectQuestion04Type;
  String? selectQuestion05Type;

  String user_question_1 = 'Question 01';
  String user_question_2 = 'Question 02';
  String user_question_3 = 'Question 03';
  String user_question_4 = 'Question 04';
  String user_question_5 = 'Question 05';

  String question_01_id = '';
  String question_02_id = '';
  String question_03_id = '';
  String question_04_id = '';
  String question_05_id = '';

  getQuestionAnswers() async {
    // var myUrl = "http://1.0.2.2:5000/category/categories";
    var myUrl = "http://localhost:5000/question/getQuestions/Sports";

    var response = await http.get(Uri.parse(myUrl));
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print(items[0]['questionBody']);
      print(items[0]['questionAnswers']);
      setState(() {
        questionAnswers = items;

        user_question_1 = items[0]['questionBody'];
        user_question_2 = items[1]['questionBody'];
        user_question_3 = items[2]['questionBody'];
        user_question_4 = items[3]['questionBody'];
        user_question_5 = items[4]['questionBody'];

        question_answers_01 = items[0]['questionAnswers'];
        question_answers_02 = items[1]['questionAnswers'];
        question_answers_03 = items[2]['questionAnswers'];
        question_answers_04 = items[3]['questionAnswers'];
        question_answers_05 = items[4]['questionAnswers'];

        question_01_id = items[0]['_id'];
        question_02_id = items[1]['_id'];
        question_03_id = items[2]['_id'];
        question_04_id = items[3]['_id'];
        question_05_id = items[4]['_id'];
        
      });
    } else {
      setState(() {
        questionAnswers = [];
      });
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getQuestionAnswers();

    setState(() {
      categoryName = widget.categoryName;
      userEmail = widget.userEmail;

      question_1 = widget.question_1;
      question_2 = widget.question_2;
      question_3 = widget.question_3;
      question_4 = widget.question_4;
      question_5 = widget.question_5;

      user_question_1 = widget.question_1['question'].toString();
      user_question_2 = widget.question_2['question'].toString();
      user_question_3 = widget.question_3['question'].toString();
      user_question_4 = widget.question_4['question'].toString();
      user_question_5 = widget.question_5['question'].toString();

      selectQuestion01Type = widget.question_1['answer'].toString();
      selectQuestion02Type = widget.question_2['answer'].toString();
      selectQuestion03Type = widget.question_3['answer'].toString();
      selectQuestion04Type = widget.question_4['answer'].toString();
      selectQuestion05Type = widget.question_5['answer'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Edit Category - Sports',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          margin: const EdgeInsets.only(top: 40),
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
                        Container(
                          margin: const EdgeInsets.only(left: 22.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              user_question_1,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              hintTextDirection: null,
                              fillColor: Colors.black12,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
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
                            isExpanded: true,
                            dropdownColor: Colors.teal,
                            hint: Text('Select answer',
                                textDirection: null,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white)),
                            value: selectQuestion01Type,
                            onChanged: (newValue) {
                              setState(() {
                                selectQuestion01Type = newValue as String?;
                                question_1 = {
                                  'id': question_01_id,
                                  'question': user_question_1,
                                  'answer': selectQuestion01Type
                                };
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please answer the question 01';
                              } else {
                                return null;
                              }
                            },
                            items: question_answers_01.map((question01Type) {
                              return DropdownMenuItem(
                                child: new Text(question01Type,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                                value: question01Type,
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 22.0, top: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              user_question_2,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              hintTextDirection: null,
                              fillColor: Colors.black12,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
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
                            isExpanded: true,
                            dropdownColor: Colors.teal,
                            hint: Text('Select answer',
                                textDirection: null,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white)),
                            value: selectQuestion02Type,
                            onChanged: (newValue) {
                              setState(() {
                                selectQuestion02Type = newValue as String?;
                                question_2 = {
                                  'id': question_02_id,
                                  'question': user_question_2,
                                  'answer': selectQuestion02Type
                                };
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please answer the 2nd question';
                              } else {
                                return null;
                              }
                            },
                            items: question_answers_02.map((question02Type) {
                              return DropdownMenuItem(
                                child: new Text(question02Type,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                                value: question02Type,
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 22.0, top: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              user_question_3,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              hintTextDirection: null,
                              fillColor: Colors.black12,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
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
                            isExpanded: true,
                            dropdownColor: Colors.teal,
                            hint: Text('Select answer',
                                textDirection: null,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white)),
                            value: selectQuestion03Type,
                            onChanged: (newValue) {
                              setState(() {
                                selectQuestion03Type = newValue as String?;
                                question_3 = {
                                  'id': question_03_id,
                                  'question': user_question_3,
                                  'answer': selectQuestion03Type
                                };
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an account type';
                              } else {
                                return null;
                              }
                            },
                            items: question_answers_03.map((question03Type) {
                              return DropdownMenuItem(
                                child: new Text(question03Type,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                                value: question03Type,
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 22.0, top: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              user_question_4,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              hintTextDirection: null,
                              fillColor: Colors.black12,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
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
                            isExpanded: true,
                            dropdownColor: Colors.teal,
                            hint: Text('Select answer',
                                textDirection: null,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white)),
                            value: selectQuestion04Type,
                            onChanged: (newValue) {
                              setState(() {
                                selectQuestion04Type = newValue as String?;
                                question_4 = {
                                  'id': question_04_id,
                                  'question': user_question_4,
                                  'answer': selectQuestion04Type
                                };
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an account type';
                              } else {
                                return null;
                              }
                            },
                            items: question_answers_04.map((question04Type) {
                              return DropdownMenuItem(
                                child: new Text(question04Type,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                                value: question04Type,
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 22.0, top: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              user_question_5,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              hintTextDirection: null,
                              fillColor: Colors.black12,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
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
                            isExpanded: true,
                            dropdownColor: Colors.teal,
                            hint: Text('Select answer',
                                textDirection: null,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white)),
                            value: selectQuestion05Type,
                            onChanged: (newValue) {
                              setState(() {
                                selectQuestion05Type = newValue as String?;
                                question_5 = {
                                  'id': question_05_id,
                                  'question': user_question_5,
                                  'answer': selectQuestion05Type
                                };
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an account type';
                              } else {
                                return null;
                              }
                            },
                            items: question_answers_05.map((question05Type) {
                              return DropdownMenuItem(
                                child: new Text(question05Type,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                                value: question05Type,
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Container(
                            height: 50,
                            width: 200,
                            child: FlatButton(
                                color: Colors.teal,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    UserQuestionAnswer().userInputEdit(
                                        question_1,
                                        question_2,
                                        question_3,
                                        question_4,
                                        question_5);
                                    print('editted');
                                  } else {
                                    print("no");
                                  }
                                },
                                child: Text("Submit",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white))),
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
