import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/SignIn.dart';
import 'package:mobile/services/service_user_question_answer.dart';
import 'package:mobile/user_questions/sample1.dart';

class UserAnswerSubmit extends StatefulWidget {
  const UserAnswerSubmit({Key? key}) : super(key: key);

  @override
  _UserAnswerSubmitState createState() => _UserAnswerSubmitState();
}

Color textfieldcolor = Colors.black;

var userEmail, userPassword, userConfirmPassword;

class _UserAnswerSubmitState extends State<UserAnswerSubmit> {
  final _formKey = GlobalKey<FormState>();

  var categoryName = 'Sports',
      userEmail = 'a@gmail.com',
      question_1,
      question_2,
      question_3,
      question_4,
      question_5;

  List<String> question_answers_01 = ['answer 1', 'answer 2'];
  List<String> question_answers_02 = ['answer 1', 'answer 2'];
  List<String> question_answers_03 = ['answer 1', 'answer 2'];
  List<String> question_answers_04 = ['answer 1', 'answer 2'];
  List<String> question_answers_05 = ['answer 1', 'answer 2'];

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

  // print();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Category - Sports',
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
                                  'id': 1,
                                  'question1': user_question_1,
                                  'answer1': selectQuestion01Type
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
                                  'id': 2,
                                  'question2': user_question_2,
                                  'answer2': selectQuestion02Type
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
                                  'id': 3,
                                  'question3': user_question_3,
                                  'answer3': selectQuestion03Type
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
                                  'id': 4,
                                  'question4': user_question_4,
                                  'answer4': selectQuestion04Type
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
                                  'id': 5,
                                  'question5': user_question_5,
                                  'answer5': selectQuestion05Type
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
                                    UserQuestionAnswer().userInputAdd(
                                        categoryName,
                                        userEmail,
                                        question_1,
                                        question_2,
                                        question_3,
                                        question_4,
                                        question_5);
                                    print('clicked');
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
