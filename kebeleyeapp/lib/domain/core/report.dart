import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

import '../auth/members.dart';
import '../auth/officials.dart';

class Report extends Equatable {
  String reportcontent;
  Member user;
  Official official;
  int? id;

  Report(
      {required this.reportcontent,
      required this.user,
      required this.official});

  @override
  // TODO: implement props
  List<Object?> get props => [];

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
        reportcontent: json['post'],
        official: json['official'],
        user: json['user']);
  }
}
