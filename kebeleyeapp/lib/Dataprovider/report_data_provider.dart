import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kebeleyeapp/models/members.dart';

import '../models/officials.dart';
import '../models/report.dart';

class ReportDataProvider {
  static const String _baseUrl = "http://127.0.0.1:8000/post/";
  ReportDataProvider();

  Future<Report> create(Report report) async {
    final http.Response response =
        await http.post(Uri.parse("$_baseUrl/post/report/"),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonEncode({
              "post": report.reportcontent,
              "user": report.user,
              "official": report.official,
            }));
    if (response.statusCode == 201) {
      return Report.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create posts.");
    }
  }

  Future<List<Report>> fetchreportByuser(Member user) async {
    final response = await http
        .get(Uri.parse("$_baseUrl/post/userfilteredreports/?user=user.id"));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final Iterable list = json;

      return list.map((value) => Report.fromJson(value)).toList();
    } else {
      throw Exception("Fetching reports failed.");
    }
  }

  Future<List<Report>> fetchreportByOfficial(
      Official official, Report report) async {
    final response = await http.get(Uri.parse(
        "$_baseUrl/post/officialfilteredreports/?official=official.id"));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final Iterable list = json;

      return list.map((value) => Report.fromJson(value)).toList();
    } else {
      throw Exception("Fetching reports failed.");
    }
  }

  Future<Report> update(String reportcontent, Report report) async {
    final response =
        await http.put(Uri.parse("$_baseUrl/post/report/{report.id}"),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonEncode({
              "reportcontent": reportcontent,
              "user": report.user,
              "official": report.official,
            }));
    if (response.statusCode == 200) {
      return Report.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the report.");
    }
  }

  Future<void> delete(Report report) async {
    final response =
        await http.delete(Uri.parse("$_baseUrl/post/report/{report.id}"));
    if (response.statusCode != 204) {
      throw Exception("Deletion Failed.");
    }
  }
}
