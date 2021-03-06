import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/categoryList.dart';
import 'package:mobile/user_questions/user_view_profile.dart';

class UserQuestionAnswer {
  Dio dio = new Dio();

  String getCategoriesUrl = "http://localhost:5000/category/categories";

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
      return Get.off(() => UserViewProfile(userEmail:userEmail));
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

  userInputEdit(userEmail,
      question_1, question_2, question_3, question_4, question_5) async {
    try {
      await dio.put('http://localhost:5000/user-question/update/${userEmail}',
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

      return Get.off(() => UserViewProfile(userEmail: userEmail));
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
          'http://localhost:5000/user-question/get-one/a@gmail.com'));
    } catch (e) {
      print(e);
    }
  }

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
