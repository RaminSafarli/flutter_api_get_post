import 'package:flutter/material.dart';
import 'package:flutter_api/model/post_model.dart';
import 'package:flutter_api/service/post_service.dart';

import 'AddPost.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSuccess = false;
  List<PostModel>? posts;

  PostService postService = PostService();
  Future<void> fetchPost() async {
    List<PostModel>? fetchedPosts = await postService.getPosts();
    setState(() {
      posts = fetchedPosts;
      isSuccess = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Posts",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: isSuccess
          ? ListView.builder(
              itemCount: posts?.length ?? 0,
              itemBuilder: (context, index) {
                PostModel post = posts![index];
                return ListTile(
                  title: Text(
                    post.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(post.body),
                  leading: Text(post.userId.toString()),
                );
              },
            )
          : Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: fetchPost,
                child: const Text(
                  "Get Posts",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddPostPage(),
            ),
          );
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
