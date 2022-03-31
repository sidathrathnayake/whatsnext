import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
//import 'package:mobile/dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/categoryList.dart';

class Categories {
  Dio dio = new Dio();

  String getCategoriesUrl = "http://10.0.2.2:5000/category/categories";

  categoryadd(categoryName) async {
    try {
        await dio.post('http://10.0.2.2:5000/category/categoryadd',
          data: {
            'categoryName': categoryName,
          },
          options: Options(contentType: Headers.jsonContentType));

        return Get.off(() => CategoryList());

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

  categoryedit(id, categoryName) async {
    try {
      await dio.put('http://10.0.2.2:5000/category/updatecategory/$id',
          data: {
            '_id': id,
            'categoryName': categoryName,
          },
          options: Options(contentType: Headers.jsonContentType));

      return Get.off(() => CategoryList());
      
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

  categorydelete(id) async {
    try {
      await dio.delete('http://10.0.2.2:5000/category/deletecategory/$id',
          data: {
            '_id': id,
          },
          options: Options(contentType: Headers.jsonContentType));

      return Get.off(() => CategoryList());
      
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
