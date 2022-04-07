import 'dart:convert';
import 'package:mobile/models/comment.dart';

class Post{
  late String object_id;
  late String user_id;
  late String user_post;


  Post(
    this.object_id,
    this.user_id,
    this.user_post
  );

  factory Post.fromJson(dynamic json){
    return Post(
      json['_id'] as String,
      json['userID'] as String,
      json['post'] as String,
    );
  }
}