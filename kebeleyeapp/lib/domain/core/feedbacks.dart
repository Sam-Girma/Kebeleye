import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../auth/members.dart';
import '../auth/officials.dart';

class Feedback extends Equatable {
  String feedbackcontent;
  Member user;
  Official official;
  int? id;
  Feedback(
      {required this.feedbackcontent,
      required this.user,
      required this.official});

  @override
  // TODO: implement props
  List<Object?> get props => [];
  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
        feedbackcontent: json['post'],
        user: json['user'],
        official: json['official']);
  }
}
