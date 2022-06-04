import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kebeleyeapp/models/feedbacks.dart';
import 'package:kebeleyeapp/models/members.dart';
import '../repository/Feedback.dart';
import '../models/feedbacks.dart';

class FeedbackDataProvider{
  static const String _baseUrl = "";
  FeedbackDataProvider() {
    // TODO: implement FeedbackDataProvider
    throw UnimplementedError();
  }

Future<Feedback> create(Feedback feedback) async {
  final http.Response response = await http.post(Uri.parse(_baseUrl),
  headers: <String, String> {"Content-Type": "application/json"},
  body: jsonEncode(
    {
      "feedbackcontent": feedback.feedbackcontent ,
      "user": feedback.user,
      "official":feedback.official,
    }
  ));
if (response.statusCode == 201){
  return Feedback.fromJson(jsonDecode(response.body));
}
{
  throw Exception("Failed to create feedback.");
}


}
Future<List<Feedback>> fetchFeedbackByuser(Member user) async{
  final response = await http.get(Uri.parse(_baseUrl));

  if (response.statusCode == 200){
    final json = jsonDecode(response.body);
      final Iterable list = json["post"];

      return list.map((value) => Feedback.fromJson(value)).toList();
    
  }
  else{
    throw Exception("Fetching Feedback failed.");
  }
}
Future<Feedback> update(String feedbackcontent,Feedback feedback) async{
  final response = await http.put(Uri.parse(_baseUrl),
  headers: <String, String>{"Content-Type": "application/json"},
  body: jsonEncode({
    "feedbackcontent": feedbackcontent,
    "user": feedback.user,
    "official": feedback.official,


  }));
  if (response.statusCode == 200){
    return Feedback.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Could not update the feedback.");
  }
}

Future<void> delete(Feedback feedback) async {
  final response = await http.delete(Uri.parse(_baseUrl));
  if (response.statusCode != 204){
    throw Exception("Deletion Failed.");
  }
}

}