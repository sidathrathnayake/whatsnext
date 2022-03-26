import 'package:flutter/material.dart';
import 'package:mobile/SignIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

Color textfieldcolor = Colors.black;

var userEmail, userPassword, userConfirmPassword;

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Sign up',
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
                              child: Image.asset("images/signup.png")),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => SignIn()));
                                },
                                child: Text(
                                  "Already have an account ?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Colors.black54),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: TextEditingController(text: userEmail),
                            onChanged: (value) {
                              userEmail = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Email';
                              } else if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return null;
                              } else {
                                return 'Please enter valid email!';
                              }
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: Image.asset("icons/email.png"),
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  fontSize: 16, color: textfieldcolor),
                              fillColor: Colors.black12,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.teal,
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller:
                                TextEditingController(text: userPassword),
                            onChanged: (value) {
                              userPassword = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              } else if (value.length < 6) {
                                return 'Password must contain atleast 6 characters';
                              }
                              return null;
                            },
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: Image.asset("icons/password.png"),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  fontSize: 16, color: textfieldcolor),
                              fillColor: Colors.black12,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.teal,
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: TextEditingController(
                                text: userConfirmPassword),
                            onChanged: (value) {
                              userConfirmPassword = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please confirm password';
                              } else if (userPassword != userConfirmPassword) {
                                return 'Passwords are not matching. Please try again';
                              }

                              return null;
                            },
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon:
                                  Image.asset("icons/confirmpassword.png"),
                              labelText: "Confirm Password",
                              labelStyle: TextStyle(
                                  fontSize: 16, color: textfieldcolor),
                              fillColor: Colors.black12,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                  color: Colors.teal,
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Container(
                            height: 60,
                            width: 400,
                            child: FlatButton(
                                color: Colors.teal,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {
                                  // if (_formKey.currentState!.validate()) {
                                  //   Navigator.push(
                                  //           context,
                                  //           new MaterialPageRoute(
                                  //               builder: (context) =>
                                  //                   Signin()));
                                  //   Service()
                                  //       .register(
                                  //           userAccType,
                                  //           userAccNumber,
                                  //           userIdType,
                                  //           userIdNumber,
                                  //           userEmail,
                                  //           userPhone,
                                  //           userPassword)
                                  //       .then((val) {
                                  //     if (val.data['success']) {
                                  //       Fluttertoast.showToast(
                                  //           msg: "Successfully Registered!",
                                  //           toastLength: Toast.LENGTH_SHORT,
                                  //           gravity: ToastGravity.BOTTOM,
                                  //           timeInSecForIosWeb: 1,
                                  //           backgroundColor: Colors.green,
                                  //           textColor: Colors.white,
                                  //           fontSize: 16.0);

                                  //     } else {
                                  //       Fluttertoast.showToast(
                                  //           msg:
                                  //               "Something went wrong.Please try again!",
                                  //           toastLength: Toast.LENGTH_SHORT,
                                  //           gravity: ToastGravity.BOTTOM,
                                  //           timeInSecForIosWeb: 1,
                                  //           backgroundColor: Colors.red,
                                  //           textColor: Colors.white,
                                  //           fontSize: 16.0);
                                  //     }
                                  //   });
                                  // } else {
                                  //   print("Error");
                                  // }
                                },
                                child: Text(
                                  "Sign up",
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
