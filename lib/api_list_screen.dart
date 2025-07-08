import 'package:dio/dio.dart';
import 'package:first_project/post_model.dart';
import 'package:flutter/material.dart';

import 'comment_model.dart';

class ApiListScreen extends StatefulWidget {
  const ApiListScreen({super.key});

  @override
  State<ApiListScreen> createState() => _ApiListScreenState();
}

class _ApiListScreenState extends State<ApiListScreen> {
  List<PostModel> postList = [];
  List<CommentModel> commentList = [];

  bool isLoading = false;

  @override
  void initState() {
    getPosts();
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API List"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: commentList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(commentList[index].email!),
                  subtitle: Text(commentList[index].body!),
                );
              },
            ),
    );
  }

  void getPosts() async {
    isLoading = true;
    var result = await Dio().get("https://jsonplaceholder.typicode.com/posts");
    List<dynamic> myList = result.data;
    for (var item in myList) {
      postList.add(PostModel.fromJson(item));
    }

    setState(() {
      isLoading = false;
    });
  }

  void getComments() async {
    var result =
        await Dio().get("https://jsonplaceholder.typicode.com/comments");
    List<dynamic> myList = result.data;
    for (var item in myList) {
      commentList.add(CommentModel.fromJson(item));
    }

    setState(() {
      isLoading = false;
    });
  }
}
