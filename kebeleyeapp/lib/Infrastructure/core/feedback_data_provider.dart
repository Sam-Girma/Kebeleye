import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/auth/members.dart';
import '../../domain/core/feedbacks.dart';

class FeedbackDataProvider {
  static const String _baseUrl = "http://127.0.0.1:8000";
  FeedbackDataProvider() {
    // TODO: implement FeedbackDataProvider
    throw UnimplementedError();
  }

  Future<Feedback> create(Feedback feedback) async {
    final http.Response response =
        await http.post(Uri.parse("$_baseUrl/post/feedback/"),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonEncode({
              "post": feedback.feedbackcontent,
              "user": feedback.user,
              "official": feedback.official,
            }));
    if (response.statusCode == 201) {
      return Feedback.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create feedback.");
    }
  }

  Future<List> fetchFeedbackByuser(Member user) async {
    final response = await http.get(
        Uri.parse("$_baseUrl/post/officialfilteredfeedbacks/?user=user.id"));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final Iterable list = json;
      return list.map((value) => Feedback.fromJson(value)).toList();
    } else {
      throw Exception("Fetching Feedback failed.");
    }
  }

  Future<Feedback> update(
    String feedbackcontent,
    Feedback feedback,
  ) async {
    final response =
        await http.put(Uri.parse("$_baseUrl/post/feedback/${feedback.id}"),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonEncode({
              "post": feedbackcontent,
              "user": feedback.user,
              "official": feedback.official,
            }));
    if (response.statusCode == 200) {
      return Feedback.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the feedback.");
    }
  }

  Future<void> delete(Feedback feedback) async {
    final response =
        await http.delete(Uri.parse("$_baseUrl/post/feedback/${feedback.id}"));
    if (response.statusCode != 204) {
      throw Exception("Deletion Failed.");
    }
  }
}
