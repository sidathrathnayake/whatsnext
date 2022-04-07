import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
//import 'package:mobile/dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/categoryList.dart';
import 'package:mobile/user_questions/user_view_profile.dart';

class UserQuestionAnswer {
  Dio dio = new Dio();

  String getCategoriesUrl = "http://192.168.8.103:5000/category/categories";

  userInputAdd(categoryName, userEmail, question_1, question_2, question_3,
      question_4, question_5) async {
    try {
      await dio.post('http://localhost:5000/user-question/insert',
          data: {
            'categoryName': categoryName,
            'userEmail': userEmail,
            'question_1': question_1,
            'question_2': question_2,
            'question_3': question_3,
            'question_4': question_4,
            'question_5': question_5,
          },
          options: Options(contentType: Headers.jsonContentType));
      Fluttertoast.showToast(
          msg: 'User Answers Added Successfull!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webBgColor: '#808080',
          textColor: Colors.white,
          fontSize: 16.0);
      return Get.off(() => UserViewProfile());
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Unable to add!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  userInputEdit(
      question_1, question_2, question_3, question_4, question_5) async {
    try {
      await dio.put('http://localhost:5000/user-question/update/a@gmail.com',
          data: {
            // 'categoryName': categoryName,
            // 'userEmail': userEmail,
            'question_1': question_1,
            'question_2': question_2,
            'question_3': question_3,
            'question_4': question_4,
            'question_5': question_5,
          },
          options: Options(contentType: Headers.jsonContentType));
      Fluttertoast.showToast(
          msg: 'User Answers Edited Successfull!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webBgColor: '#808080',
          textColor: Colors.white,
          fontSize: 16.0);

      return Get.off(() => UserViewProfile());
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Unable to update!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future userInputGetSingle() async {
    try {
      await http.get(Uri.parse(
          'http://192.168.8.103:5000/user-question/get-one/a@gmail.com'));
    } catch (e) {
      print(e);
    }
  }
  // categorydelete(id) async {
  //   try {
  //     await dio.delete('http://10.0.2.2:5000/category/deletecategory/$id',
  //         data: {
  //           '_id': id,
  //         },
  //         options: Options(contentType: Headers.jsonContentType));

  //     return Get.off(() => CategoryList());

  //   } on DioError catch (e) {
  //     Fluttertoast.showToast(
  //         msg: 'Unable to delete!',
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }
  // }

  Future<List?> getUserQuestionAnswer() async {
    try {
      String myUrl = "$getCategoriesUrl";

      http.Response response = await http.get(Uri.parse(myUrl), headers: {
        'Accept': 'application/json',
      });
      print(response.body);
      return json.decode(response.body);
    } on HttpException catch (e) {
      Fluttertoast.showToast(
          msg: 'Unable to add!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return null;
  }
}
