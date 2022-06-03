import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/report.dart';

class ReportDataProvider{
  static const String _baseUrl = "";
  ReportDataProvider();

Future<Report> create (Report report) async {
  final http.Response response = await http.post(Uri.parse(_baseUrl),
  headers: <String, String> {"Content-Type": "application/json"},
  body: jsonEncode(
    {
      "reportcontent": report.reportcontent,
      "datetime": report.datetime,
    }
  ));
if (response.statusCode == 201){
  return Report.fromJson(jsonDecode(response.body));
}
{
  throw Exception("Failed to create posts.");
}


}
Future<Report> fetchByboolian(bool is_report) async{
  final response = await http.get(Uri.parse("$_baseUrl/$is_report"));

  if (response.statusCode == 200){
    return Report.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Fetching reports failed.");
  }
}
Future<Report> fetchreportByname(String username) async{
  final response = await http.get(Uri.parse("$_baseUrl/$username"));

  if (response.statusCode == 200){
    return Report.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Fetching reports failed.");
  }
}
Future<Report> update(String reportcontent,Report report) async{
  final response = await http.put(Uri.parse("$_baseUrl/$reportcontent"),
  headers: <String, String>{"Content-Type": "application/json"},
  body: jsonEncode({
    "reportcontent": reportcontent,
    "datetime": report.datetime,
    

  }));
  if (response.statusCode == 200){
    return Report.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Could not update the report.");
  }
}

Future<void> delete(int id) async {
  final response = await http.delete(Uri.parse("$_baseUrl/$id"));
  if (response.statusCode != 204){
    throw Exception("Deletion Failed.");
  }
}

}