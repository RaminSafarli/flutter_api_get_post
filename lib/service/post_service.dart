import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/model/post_model.dart';

import '../constant/api_url.dart';

class PostService {
  final String url = "$apiUrl/posts";

  final dio = Dio();
  // List<PostModel> post;

  Future<List<PostModel>?> getPosts() async {
    final response = await dio.get<String>(url);

    if (response.statusCode == 200) {
      var post = postModelFromJson(response.data!);
      debugPrint("Successfully fetched data!");
      return post;
    } else {
      debugPrint("Unable to fetch data!");
      return null;
    }
  }

  Future addPost(var title, var body, var user) async {
    PostModel post = PostModel(userId: user, id: 1, title: title, body: body);
    final response = await dio.post(url, data: post.toJson());

    if (response.statusCode == 201) {
      debugPrint("Successfully created!");
    } else {
      debugPrint("Unable to post!");
    }
  }
}
