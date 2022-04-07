import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile/models/comment.dart';
import 'package:mobile/user_feeds/post_page.dart';

class UpdateComment extends StatefulWidget {
  final Comment comment;
  const UpdateComment({Key? key, required this.comment}) : super(key: key);

  @override
  State<UpdateComment> createState() => _UpdateCommentState(comment);
}

class _UpdateCommentState extends State<UpdateComment> {
  Comment _comment;
  _UpdateCommentState(this._comment);
  final _formKey = GlobalKey<FormState>();
  var updatedValue;

  Future updateComment() async {
    final String updateComment = 'http://localhost:5000/posts/update-comment/${_comment.id}';
    final String userID = "61e7b05ea716b43e1c6013e6";
    Dio dio = new Dio();
    dio.options.headers = {'Content-Type': 'application/json'};
    try {
      var response = await dio.put(updateComment,
          data: {"message": updatedValue},
          options: Options(contentType: Headers.jsonContentType));

      print('>${userID},${updatedValue}');

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: response.data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostPage()));
      }
    } on DioError catch (error) {
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
          child: Text("Update Comment"),
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
                      updatedValue = value;
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
                          updateComment();
                          print("Updated");
                        }
                      },
                      child: Text(
                        "Post",
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
