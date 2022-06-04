import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/officials.dart';

class OfficialDataProvider{
  static const String _baseUrl = "";
  OfficialDataProvider();

Future<Official> create (String username, String department, String password) async {
  final http.Response response = await http.post(Uri.parse(_baseUrl),
  headers: <String, String> {"Content-Type": "application/json"},
  body: jsonEncode(
    {
      "username": username,
      "department": department,
      "password": password,
    }
  ));
if (response.statusCode == 201){
  return Official.fromJson(jsonDecode(response.body));
}
{
  throw Exception("Failed to create official");
}


}
Future<Official> fetchByDepartment(String position) async{
  final response = await http.get(Uri.parse(_baseUrl));

  if (response.statusCode == 200){
    return Official.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Fetching Official by department failed.");
  }
}
Future<Official> update(String username,Official official) async{
  final response = await http.put(Uri.parse(_baseUrl),
  headers: <String, String>{"Content-Type": "application/json"},
  body: jsonEncode({
    "username": username,
    "position": official.position,
    "imageUrl": official.offcialimageurl,

  }));
  if (response.statusCode == 200){
    return Official.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Could not update the name.");
  }
}

Future<void> delete(int kebeleid) async {
  final response = await http.delete(Uri.parse(_baseUrl));
  if (response.statusCode != 204){
    throw Exception("Deletion Failed.");
  }
}

  Future<Official> fetchOfficial(String username, String password) async{
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200){
      return Official.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("Fetching failed.");
    }
  }

}