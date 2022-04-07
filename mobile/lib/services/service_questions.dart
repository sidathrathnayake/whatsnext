import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mobile/questionsList.dart';
import 'package:http/http.dart' as http;

class Questions {
  Dio dio = new Dio();

  String getQuestionsLink = "http://10.0.2.2:5000/question/categories";

  questionadd(questionBody, selectedCategory, questionAnswersList) async {
    var answerList = questionAnswersList
        .replaceAll('{', '')
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll('}', '')
        .replaceAll(':', '')
        .replaceAll('value', '')
        .toString()
        .trim()
        .split(',');

    try {
      await dio.post('http://10.0.2.2:5000/question/questionadd',
          data: {
            'questionBody': questionBody,
            'categoryName': selectedCategory,
            'questionAnswers': answerList,
          },
          options: Options(contentType: Headers.jsonContentType));

      return Get.off(() => QuestionsList());
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

  questionedit(id, questionBody, categoryName, questionAnswers) async {
    try {
      await dio.put('http://10.0.2.2:5000/question/updatequestion/$id',
          data: {
            '_id': id,
            'questionBody': questionBody,
            'categoryName': categoryName,
            'questionAnswers': questionAnswers,
          },
          options: Options(contentType: Headers.jsonContentType));
      return Get.off(() => QuestionsList());
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

  questiondelete(id) async {
    try {
      await dio.delete('http://10.0.2.2:5000/question/deletequestion/$id',
          data: {
            '_id': id,
          },
          options: Options(contentType: Headers.jsonContentType));

      return Get.off(() => QuestionsList());
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Unable to delete!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<List?> getCategories() async {
    try {
      String myUrl = "$getQuestionsLink";

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
