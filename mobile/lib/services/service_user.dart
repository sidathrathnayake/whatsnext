import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mobile/mainMenu.dart';
//import 'package:mobile/dashboard.dart';
import 'package:mobile/signin.dart';
import 'package:mobile/userList.dart';
import 'package:mobile/user_questions/user_select_category.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class User {
  Dio dio = new Dio();
  register(userEmail, userPassword) async {
    try {
      // return await dio.post('http://localhost:5000/user/userregister',
       await dio.post('http://localhost:5000/user/userregister',
          data: {'userEmail': userEmail, 'userPassword': userPassword},
          options: Options(contentType: Headers.jsonContentType));
          return Get.off(() => UserSelectCategory());
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
      await dio.post('http://localhost:5000/user/userlogin',
          data: {
            'userEmail': userEmail,
            'userPassword': userPassword,
          },
          options: Options(contentType: Headers.jsonContentType));
          return Get.off(() => MainMenu());
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

  String getCategoriesUrl = "http://localhost:5000/category/categories";

  // Future<List?> getCategories() async {
  //   try {
  //     String myUrl = "$getCategoriesUrl";

  //     http.Response response = await http.get(Uri.parse(myUrl), headers: {
  //       'Accept': 'application/json',
  //     });
  //     print(response.body);
  //     return json.decode(response.body);
  //   } on HttpException catch (e) {
  //     Fluttertoast.showToast(
  //         msg: 'Unable to add!',
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }
  //   return null;
  // }

  deleteUser(id) async {
    try {
      await dio.delete('http://localhost:5000/user/delete/$id',
          options: Options(contentType: Headers.jsonContentType));

      Fluttertoast.showToast(
          msg: 'Deleting User Successfull!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webBgColor:'#808080',
          textColor: Colors.white,
          fontSize: 16.0);

        return Get.off(() => UserList());
      
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Delete User Failed!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webBgColor:'#808080',
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

}
