import 'package:flutter/material.dart';
import 'package:mobile/user_feeds/comment_page.dart';
import 'package:mobile/user_feeds/post_page.dart';
import '../models/Post.dart';
import 'package:mobile/services/post_services.dart';

class PostTile extends StatelessWidget{
  final PostServices postServices;
  final Post post;
  const PostTile({Key? key, required this.post}) : postServices = const PostServices(),super(key: key);
  static String userID = "61e7b05ea716b43e1c6013e6";

  Future deletePost(String _id) async {
    await postServices.deletePost(_id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentPage(singlePost:post))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle, color: Color.fromARGB(255, 182, 182, 182),),
                ),
                Text('${post.user_post}')
              ],
            ),
          ),
          IconButton(
            onPressed: (){
              deletePost(post.object_id);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostPage()));
            }, 
            icon: Icon(
              Icons.delete_forever_rounded,
              color: Color.fromARGB(255, 255, 127, 118),
            )
          )
        ],
      ),
    );
  }

}