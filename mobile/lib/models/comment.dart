class Comment{
  late String id;
  late String userID;
  late String username;
  late String message;

  Comment(
    this.id,
    this.userID,
    this.username,
    this.message
  );

  factory Comment.fromJson(dynamic json){
    return Comment(
      json['_id'] as String,
      json['userID'] as String,
      json['userName'] as String,
      json['message'] as String,
    );
  }
}