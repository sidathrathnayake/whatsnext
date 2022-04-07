import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/components/post_tile.dart';
import 'package:mobile/models/Post.dart';
import 'package:mobile/services/post_services.dart';
import 'package:mobile/user_feeds/AddPost.dart';

class PostPage extends StatefulWidget {
  static const String routerName = '/post';
  final PostServices postServices;
  
  const PostPage({Key? key}) : postServices = const PostServices(), super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _formKey = GlobalKey<FormState>();

  
  @override
  initState(){
    super.initState();
  }

  Future<List<Post>> getAllPost() async{
    List<Post> tagObjJson = await widget.postServices.getAllPosts();
    return tagObjJson;
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search_rounded),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2.0),
                      ),
                      labelText: 'Search your problem here',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2.0),
                      ),
                    ),
                  )),
              Expanded(
                  child: FutureBuilder<List<Post>>(
                    future: getAllPost(),
                    builder: (context, snapshot){
                      if(snapshot.data == null){
                        return Center(
                          child: CircularProgressIndicator()
                        );
                      }else{
                        return new ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int currentIndex){
                            return PostTile(post: snapshot.data![currentIndex]);
                          }
                          );
                      }
                    },
                  )
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.mode_edit),
          onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPost())),
          ),
    );
  }
}
