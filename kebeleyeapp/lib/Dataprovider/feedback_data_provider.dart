import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kebeleyeapp/models/feedbacks.dart';
import '../repository/Feedback.dart';
import '../models/feedbacks.dart';

class FeedbackDataProvider{
  static const String _baseUrl = "";
  FeedbackDataProvider() {
    // TODO: implement FeedbackDataProvider
    throw UnimplementedError();
  }

Future<Feedback> create (Feedback feedback) async {
  final http.Response response = await http.post(Uri.parse(_baseUrl),
  headers: <String, String> {"Content-Type": "application/json"},
  body: jsonEncode(
    {
      "feedbackcontent": feedback.feedbackcontent ,
      "datetime": feedback.datetime,
    }
  ));
if (response.statusCode == 201){
  return Feedback.fromJson(jsonDecode(response.body));
}
{
  throw Exception("Failed to create feedback.");
}


}
Future<Feedback> fetchByboolian(bool isFeedback) async{
  final response = await http.get(Uri.parse("$_baseUrl/$isFeedback"));

  if (response.statusCode == 200){
    return Feedback.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Fetching feedback failed.");
  }
}
Future<Feedback> update(String feedbackcontent,Feedback feedback) async{
  final response = await http.put(Uri.parse("$_baseUrl/$feedback"),
  headers: <String, String>{"Content-Type": "application/json"},
  body: jsonEncode({
    "feedbackcontent": feedbackcontent,
    "datetime": feedback.datetime,


  }));
  if (response.statusCode == 200){
    return Feedback.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Could not update the feedback.");
  }
}

Future<void> delete(int id) async {
  final response = await http.delete(Uri.parse("$_baseUrl/$id"));
  if (response.statusCode != 204){
    throw Exception("Deletion Failed.");
  }
}

}