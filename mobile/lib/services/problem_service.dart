import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/problems/add_problem.dart';
import 'package:mobile/problems/view_problem.dart';

class Problems {
  Dio dio = new Dio();

  addProblem(title,link,tag,category) async {
    try {
      print(title);
        await dio.post('http://192.168.1.101:5000/problem/add',
          data: {
            'title': title,
            'link': link,
            'tags': tag,
            'category': category
          },
          options: Options(contentType: Headers.jsonContentType));

        Fluttertoast.showToast(
          msg: 'Adding Problem Successfull!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webBgColor:'#808080',
          textColor: Colors.white,
          fontSize: 16.0);

        return Get.off(() => ViewProblem());

    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Adding Problem Failed!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webBgColor:'#808080',
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  updateProblem(id,title,link,tag,category) async {
    try {
      await dio.put('http://192.168.1.101:5000/problem/update/$id',
          data: {
            'title': title,
            'link': link,
            'tags': tag,
            'category': category
          },
          options: Options(contentType: Headers.jsonContentType));

      Fluttertoast.showToast(
          msg: 'Problem Updated Successfully!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webBgColor:'#808080',
          textColor: Colors.white,
          fontSize: 16.0);

        return Get.off(() => ViewProblem());
      
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Update Problem Failed!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webBgColor:'#808080',
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<List?> getProblems() async {
    try {
      final viewUrl = Uri.parse("http://localhost:5000/problem/");

      http.Response response = await http.get(viewUrl, headers: {
        'Accept': 'application/json',
      });
      List listData = jsonDecode(response.body);
      var dataList = json.decode(response.body);
      print(dataList);
      print(listData);
      // return listData.map((listData) => new UserQuestion.fromJson(listData)).toList();
    } on HttpException catch (e) {
      Fluttertoast.showToast(
          msg: 'Problem Retrieve Failed!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webBgColor:'#808080',
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return null;
  }

  deleteProblem(id) async {
    try {
      await dio.delete('http://192.168.1.101:5000/problem/delete/$id',
          options: Options(contentType: Headers.jsonContentType));

       Fluttertoast.showToast(
          msg: 'Deleting Problem Successfull!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webBgColor:'#808080',
          textColor: Colors.white,
          fontSize: 16.0);

        return Get.off(() => ViewProblem());
      
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: 'Delete Problem Failed!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webBgColor:'#808080',
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
