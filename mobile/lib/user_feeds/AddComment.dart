import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile/user_feeds/comment_page.dart';

import '../models/Post.dart';
class AddComment extends StatefulWidget {
  const AddComment({ Key? key, required this.post }) : super(key: key);
  final Post post;

  @override
  State<AddComment> createState() => _AddCommentState(post);
}

class _AddCommentState extends State<AddComment> {
  Post _post;
  _AddCommentState(this._post);
  final _formKey = GlobalKey<FormState>();
  var newComment;

      Future addComment() async {

    final String addPost = 'http://localhost:5000/posts/add-comment';
    final String userID = "61e7b05ea716b43e1c6013e6";
    Dio dio = new Dio();
    dio.options.headers = {'Content-Type': 'application/json'};
    try{
      var response = await dio.post(addPost,
        data: {
          "postID":_post.object_id,
          "userID":_post.user_id,
          "userName":"Maxwel",
          "message":newComment
        },
        options: Options(contentType: Headers.jsonContentType)
      );

      print('>${userID},${newComment}');

      if (response.statusCode == 201) {
        Fluttertoast.showToast(
            msg: response.data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentPage(singlePost:_post)));
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Add New Comment"),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2.0),
                      ),
                      labelText: 'Add your comment here',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2.0),
                      ),
                    ),
                    onChanged: (value) {
                      print(value);
                      newComment = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your comment';
                      }
                    },
                    maxLines: 5,
                    minLines: 3,
                  )),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                        width: double.infinity,
                                    height: 35.0,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.teal,
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!.validate()) {
                                            addComment();
                                            print("Hello");
                                          }
                                        },
                                        child: Text(
                                          "Comment",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        )),
                                  ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}