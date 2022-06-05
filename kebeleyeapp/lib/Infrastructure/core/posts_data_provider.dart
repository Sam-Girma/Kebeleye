import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/auth/officials.dart';
import '../../domain/core/posts.dart';

class PostDataProvider {
  static const String _baseUrl = "http://127.0.0.1:8000";
  PostDataProvider();

  Future<Post> create(Post post) async {
    final http.Response response =
        await http.post(Uri.parse("$_baseUrl/post/announce/"),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonEncode({
              "post": post.postcontent,
              "created_at": post.datetime,
            }));
    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create a post.");
    }
  }

  Future<List<Post>> fetchByofficial(Official official) async {
    final response = await http.get(Uri.parse(
        "$_baseUrl/post/officialfilteredannounces/?official=official.id"));
    final Future<List<Post>> lists;
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final Iterable list = json;
      return list.map((value) => Post.fromJson(value)).toList();
    } else {
      throw Exception("Fetching posts failed.");
    }
  }

  Future<Post> update(String postcontent, Post post) async {
    final response =
        await http.put(Uri.parse("$_baseUrl/post/annouce/${post.id}"),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonEncode({
              "post-content": postcontent,
              "datetime": post.datetime,
            }));
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the post.");
    }
  }

  Future<void> delete(Post post) async {
    final response =
        await http.delete(Uri.parse("$_baseUrl/post/announce/${post.id}"));
    if (response.statusCode != 204) {
      throw Exception("Deletion Failed.");
    }
  }
}
