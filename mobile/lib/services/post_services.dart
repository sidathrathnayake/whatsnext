import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/models/Post.dart';
import 'package:mobile/models/comment.dart';
import 'package:dio/dio.dart';

class PostServices {
  static const String getallposts = "http://localhost:5000/posts/get-all-posts";
  const PostServices();

  Future<List<Post>> getAllPosts() async {
    http.Response response = await http.get(Uri.parse(getallposts));

    if (response.statusCode == 200) {
      final tagObjJson = jsonDecode(response.body)['data'] as List;
      List<Post> allPosts =
          tagObjJson.map((element) => Post.fromJson(element)).toList();
      return allPosts;
    }

    throw Exception("Error on fetching data");
  }

  Future<List<Comment>> getAllComments(String id) async {
    final String getallComments = "http://localhost:5000/posts/get-all-comments/${id}";
    print(getallComments);
    http.Response response = await http.get(Uri.parse(getallComments));
    
    if (response.statusCode == 200) {
      final tagObjJson = jsonDecode(response.body)['data'] as List;
      print(jsonDecode(response.body)['data']);
      List<Comment> allPosts =
          tagObjJson.map((element) => Comment.fromJson(element)).toList();
      return allPosts;
    }
    throw Exception("Error on fetching data");
  }

  final String userID = "61e7b05ea716b43e1c6013e6";

  Future deletePost(String id) async{
    final String deletePost = "http://localhost:5000/posts/delete-post/${id}";
    print(deletePost);

    Dio dio = new Dio();

    try{
      var response = await dio.delete(deletePost);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: response.data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);

        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPost()));
      }
    }on DioError catch(error){
      Fluttertoast.showToast(
          msg: error.response!.data['error'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

    Future deleteComment(String id) async{
    final String deleteComment = "http://localhost:5000/posts/delete-comment/${id}";
    print(deletePost);

    Dio dio = new Dio();

    try{
      var response = await dio.delete(deleteComment);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: response.data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);

        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPost()));
      }
    }on DioError catch(error){
      Fluttertoast.showToast(
          msg: error.response!.data['error'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

}
