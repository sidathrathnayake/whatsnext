import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/SignIn.dart';

class UserAnswerSubmit extends StatefulWidget {
  const UserAnswerSubmit({Key? key}) : super(key: key);

  @override
  _UserAnswerSubmitState createState() => _UserAnswerSubmitState();
}

Color textfieldcolor = Colors.black;

var userEmail, userPassword, userConfirmPassword;

class _UserAnswerSubmitState extends State<UserAnswerSubmit> {
  final _formKey = GlobalKey<FormState>();

  var userAccType,
      userAccNumber,
      userIdType,
      userIdNumber,
      userEmail,
      userPhone,
      userPassword,
      userConfirmPassword;

  List<String> AccType = ['YES', 'Jana Jaya', 'Vanitha Vasana'];
  String? selectAccType;
  String text1 = 'ABC';

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
                          margin: const EdgeInsets.only(left: 30.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Question 01',
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
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.teal,
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
                            isExpanded: true,
                            dropdownColor: Colors.teal,
                            hint: Text('Account Type',
                                textDirection: null,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white)),
                            value: selectAccType,
                            onChanged: (newValue) {
                              setState(() {
                                selectAccType = newValue as String?;
                                userAccType = selectAccType;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an account type';
                              } else {
                                return null;
                              }
                            },
                            items: AccType.map((accountType) {
                              return DropdownMenuItem(
                                child: new Text(accountType,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                                value: accountType,
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30.0, top: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Question 01',
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
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
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
                            isExpanded: true,
                            dropdownColor: Colors.teal,
                            hint: Text('Account Type',
                                textDirection: null,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white)),
                            value: selectAccType,
                            onChanged: (newValue) {
                              setState(() {
                                selectAccType = newValue as String?;
                                userAccType = selectAccType;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an account type';
                              } else {
                                return null;
                              }
                            },
                            items: AccType.map((accountType) {
                              return DropdownMenuItem(
                                child: new Text(accountType,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                                value: accountType,
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30.0, top: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Question 01',
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
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
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
                            isExpanded: true,
                            dropdownColor: Colors.teal,
                            hint: Text('Account Type',
                                textDirection: null,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white)),
                            value: selectAccType,
                            onChanged: (newValue) {
                              setState(() {
                                selectAccType = newValue as String?;
                                userAccType = selectAccType;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an account type';
                              } else {
                                return null;
                              }
                            },
                            items: AccType.map((accountType) {
                              return DropdownMenuItem(
                                child: new Text(accountType,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                                value: accountType,
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30.0, top: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Question 01',
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
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
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
                            isExpanded: true,
                            dropdownColor: Colors.teal,
                            hint: Text('Account Type',
                                textDirection: null,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white)),
                            value: selectAccType,
                            onChanged: (newValue) {
                              setState(() {
                                selectAccType = newValue as String?;
                                userAccType = selectAccType;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an account type';
                              } else {
                                return null;
                              }
                            },
                            items: AccType.map((accountType) {
                              return DropdownMenuItem(
                                child: new Text(accountType,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                                value: accountType,
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30.0, top: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Question 01',
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
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
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
                            isExpanded: true,
                            dropdownColor: Colors.teal,
                            hint: Text('Account Type',
                                textDirection: null,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white)),
                            value: selectAccType,
                            onChanged: (newValue) {
                              setState(() {
                                selectAccType = newValue as String?;
                                userAccType = selectAccType;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an account type';
                              } else {
                                return null;
                              }
                            },
                            items: AccType.map((accountType) {
                              return DropdownMenuItem(
                                child: new Text(accountType,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                                value: accountType,
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Container(
                            height: 50,
                            width: 400,
                            child: FlatButton(
                                color: Colors.teal,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // save();
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
