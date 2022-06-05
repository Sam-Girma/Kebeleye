import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/officials.dart';

class OfficialDataProvider {
  static const String _baseUrl = "http://127.0.0.1:8000";
  OfficialDataProvider();

  Future<Official> create(
      int id, String username, String department, String password) async {
    final http.Response response =
        await http.post(Uri.parse("$_baseUrl/accounts/register/official/"),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonEncode({
              "username_username": username,
              "username": id,
              "department": department,
              "password": password,
            }));
    if (response.statusCode == 201) {
      print("official Created.");
      return Official.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create official");
    }
  }

  Future<List<Official>> fetchall() async {
    final response = await http.get(Uri.parse("$_baseUrl/accounts/officials/"));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final officials = json["officials"];

      return officials.map((value) => officials.fromjson(officials)).toList();
    } else {
      throw Exception("Fetching Official by department failed.");
    }
  }

  Future<Official> update(String username, Official official) async {
    final response = await http.put(
        Uri.parse("$_baseUrl/accounts/officials/${official.id}/"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "position": official.department,
          // "imageUrl": official.offcialimageurl,
        }));
    if (response.statusCode == 200) {
      return Official.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the name.");
    }
  }

  Future<void> delete(Official official) async {
    final response = await http.delete(
        Uri.parse("$_baseUrl/accounts/officials/${official.officialnum}/"));
    if (response.statusCode != 204) {
      throw Exception("Deletion Failed.");
    }
  }

  Future<Official> fetchOfficial(String username, String password) async {
    //Assuming this is login
    final response = await http.post(Uri.parse("$_baseUrl/login/token/create/"),
        body: jsonEncode({"username": username, "password": password}));
    if (response.statusCode == 200) {
      String accessToken = jsonDecode(response.body)["token"]
          ["access"]; // This is the token for next use

      return Official.fromJson(jsonDecode(response.body)["account"]);
    } else {
      throw Exception("Fetching failed.");
    }
  }
}
