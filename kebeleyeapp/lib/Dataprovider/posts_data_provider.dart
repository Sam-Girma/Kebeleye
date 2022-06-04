import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kebeleyeapp/models/models.dart';

import '../models/posts.dart';

class PostDataProvider{
  static const String _baseUrl = "";
  PostDataProvider();

Future<Post> create (Post post) async {
  final http.Response response = await http.post(Uri.parse(_baseUrl),
  headers: <String, String> {"Content-Type": "application/json"},
  body: jsonEncode(
    {
      "post-content": post.postcontent,
      "post-datetime": post.datetime,
    }
  ));
if (response.statusCode == 201){
  return Post.fromJson(jsonDecode(response.body));
}
{
  throw Exception("Failed to create a post.");
}


}

Future<List<Post>> fetchByuser(Official official) async{
  final response = await http.get(Uri.parse("$_baseUrl/$username"));
  final Future<List> lists;
  if (response.statusCode == 200){
    return lists;
    //Post.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Fetching posts failed.");
  }
}
Future<Post> update(String postcontent,Post post) async{
  final response = await http.put(Uri.parse("$_baseUrl/$postcontent"),
  headers: <String, String>{"Content-Type": "application/json"},
  body: jsonEncode({
    "post-content": postcontent,
    
    "datetime": post.datetime,

  }));
  if (response.statusCode == 200){
    return Post.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Could not update the post.");
  }
}

Future<void> delete(Post post) async {
  final response = await http.delete(Uri.parse(_baseUrl));
  if (response.statusCode != 204){
    throw Exception("Deletion Failed.");
  }
}

}