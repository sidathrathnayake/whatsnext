import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mobile/problems/problem_menu.dart';

class Problems {
  Dio dio = new Dio();

  addProblem(title,link,tag,category) async {
    try {
      print(title);
        await dio.post('http://localhost:5000/problem/add',
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

        return Get.off(() => ProblemMenu());

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
      await dio.put('http://localhost:5000/problem/update/$id',
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

        return Get.off(() => ProblemMenu());
      
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

  deleteProblem(id) async {
    try {
      await dio.delete('http://localhost:5000/problem/delete/$id',
          options: Options(contentType: Headers.jsonContentType));

       Fluttertoast.showToast(
          msg: 'Deleting Problem Successfull!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webBgColor:'#808080',
          textColor: Colors.white,
          fontSize: 16.0);

        return Get.off(() => ProblemMenu());
      
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
