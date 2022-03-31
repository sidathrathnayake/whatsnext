import 'package:flutter/material.dart';
import 'package:mobile/categoryList.dart';
import 'package:mobile/variables/variables.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile/services/service_categories.dart';

class CategoryAdd extends StatefulWidget {
  const CategoryAdd({Key? key}) : super(key: key);

  @override
  _CategoryAddState createState() => _CategoryAddState();
}

ColorCodes colorCodes = new ColorCodes();

var categoryName;

class _CategoryAddState extends State<CategoryAdd> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'ADD CATEGORIES',
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
                              child: Image.asset("images/category.png")),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: TextEditingController(text: categoryName),
                            onChanged: (value) {
                              categoryName = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Category Name';
                              } else {
                                return null;
                              }
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: Image.asset("icons/category.png"),
                              labelText: "Category Name",
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
                                    Categories()
                                        .categoryadd(categoryName)
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
                                            msg: "Something went wrong please try again!",
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
}
