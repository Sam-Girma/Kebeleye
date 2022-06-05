import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/auth/members.dart';

class MemberDataProvider {
  static const String _baseUrl = "http://127.0.0.1:8000";
  MemberDataProvider();

  Future<Member> create(String id, String username, String password) async {
    final http.Response response =
        await http.post(Uri.parse("$_baseUrl/accounts/register/user/"),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonEncode({
              "username_name": username,
              "username": id,
              "password": password,
            }));
    if (response.statusCode == 201) {
      return Member.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create Kebele Member.");
    }
  }

  Future<Member> fetchuser(String username, String password) async {
    final response = await http.post(Uri.parse("$_baseUrl/login/token/create/"),
        body: jsonEncode({"username": username, "password": password}));

    if (response.statusCode == 200) {
      String accessToken = jsonDecode(response.body)["token"]
          ["access"]; // This is the token for next use
      return Member.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching user failed.");
    }
  }

  Future<Member> update(String password, Member member) async {
    final response = await http.put(
        Uri.parse("$_baseUrl/accounts/officials/${member.membernum}/"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "username": member.username,
          "password": password,
          "id": member.id,
        }));
    if (response.statusCode == 200) {
      return Member.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the name.");
    }
  }

  Future<void> delete(Member member) async {
    final response = await http
        .delete(Uri.parse("$_baseUrl/accounts/officials/${member.membernum}/"));
    if (response.statusCode != 204) {
      throw Exception("Deletion Failed.");
    }
  }
}
