import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
//import 'package:mobile/dashboard.dart';
import 'package:mobile/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  Dio dio = new Dio();
  register(userEmail, userPassword) async {
    try {
      return await dio.post('http://10.0.2.2:5000/user/userregister',
          data: {'userEmail': userEmail, 'userPassword': userPassword},
          options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Unable to register!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  login(userEmail, userPassword) async {
    try {
      return await dio.post('http://10.0.2.2:5000/user/userlogin',
          data: {
            'userEmail': userEmail,
            'userPassword': userPassword,
          },
          options: Options(contentType: Headers.jsonContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Unable to Sign-in!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  asyncFunc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null) {
      return null;
    } else {
      Get.off(() => SignIn());
    }
  }

  signout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    prefs.remove('token');
    Get.off(() => SignIn());
  }

}
