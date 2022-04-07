import 'package:flutter/material.dart';
import 'package:mobile/models/Post.dart';
import 'package:mobile/models/comment.dart';
import 'package:mobile/services/post_services.dart';
import 'package:mobile/user_feeds/AddComment.dart';
import 'package:mobile/user_feeds/UpdateComment.dart';

class CommentPage extends StatefulWidget {
  static const String routerName = '/comment';
  final PostServices postServices;

  final Post singlePost;
  const CommentPage({Key? key, required this.singlePost})
      : postServices = const PostServices(),
        super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState(singlePost);
}

class _CommentPageState extends State<CommentPage> {
  Post singlePost;
  _CommentPageState(this.singlePost);

  static String userID = "61e7b05ea716b43e1c6013e6";

  Future<List<Comment>> getAllComments() async {
    List<Comment> tagObjJson =
        await widget.postServices.getAllComments(singlePost.object_id);
    return tagObjJson;
  }

  Future deleteComment(String _id)async {
    await widget.postServices.deleteComment(_id);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => super.widget));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("User Posts"),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
          child: Column(
            children: [
              Card(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 98, 180, 247),
                              ),
                              color: Color.fromARGB(255, 209, 233, 253)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${singlePost.user_post}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: FutureBuilder<List<Comment>>(
                      future: getAllComments(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return new ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder:
                                  (BuildContext context, int currentIndex) {
                                return Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              '${snapshot.data![currentIndex].message}'),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 10),
                                        ),
                                        onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdateComment(comment: snapshot.data![currentIndex],))),
                                        child: const Text('Edit'),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          textStyle:
                                              const TextStyle(fontSize: 10),
                                        ),
                                        onPressed: (){
                                          deleteComment(snapshot.data![currentIndex].id);
                                        },
                                        child: const Text('Delete'),
                                      ),
                                        ],
                                      ), 
                                    ],
                                  ),
                                );
                              });
                        }
                      })),
                      
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.mode_edit),
          onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddComment(post:singlePost))),
          ),
      
    );
  }
}
