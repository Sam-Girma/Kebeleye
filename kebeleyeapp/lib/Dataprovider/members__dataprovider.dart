import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kebeleyeapp/models/members.dart';

import '../models/members.dart';

class MemberDataProvider{
  static const String _baseUrl = "";
  MemberDataProvider();

Future<Member> create (String username, String password) async {
  final http.Response response = await http.post(Uri.parse(_baseUrl),
  headers: <String, String> {"Content-Type": "application/json"},
  body: jsonEncode(
    {
      
      "username": username,
      "password": password,
    }
  ));
if (response.statusCode == 201){
  return Member.fromJson(jsonDecode(response.body));
}
{
  throw Exception("Failed to create Kebele Member.");
}


}
Future<Member> fetchuser(String username, String password) async{
  final response = await http.get(Uri.parse(_baseUrl));

  if (response.statusCode == 200){
    return Member.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Fetching user failed.");
  }
}
Future<Member> update(String password,Member member) async{
  final response = await http.put(Uri.parse(_baseUrl),
  headers: <String, String>{"Content-Type": "application/json"},
  body: jsonEncode({
    "username": member.username,
    "password": password,
    "id": member.id,

  }));
  if (response.statusCode == 200){
    return Member.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Could not update the name.");
  }
}

Future<void> delete(int id) async {
  final response = await http.delete(Uri.parse(_baseUrl));
  if (response.statusCode != 204){
    throw Exception("Deletion Failed.");
  }
}

}