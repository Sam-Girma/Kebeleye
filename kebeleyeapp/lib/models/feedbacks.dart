
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Feedback extends Equatable{
  String feedbackcontent;
  String datetime;
  bool? is_report = false;
  bool? is_announcement = false;
  bool? is_post = true;
  Feedback({required this.feedbackcontent, required this.datetime});
  

  @override
  // TODO: implement props
  List<Object?> get props => [];
factory Feedback.fromJson(Map<String, dynamic> json){
    return Feedback(feedbackcontent: json['post'], datetime: json['username']);
  }

}

