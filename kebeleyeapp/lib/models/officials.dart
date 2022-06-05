import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:equatable/equatable.dart';

class Official extends Equatable {
  Official(
      {required this.id,
      required this.officialnum,
      required this.officialName,
      required this.department});
  String? id;
  String officialName;
  int officialnum;
  String department;

  @override
  List<Object> get props => [officialName, department];

  factory Official.fromJson(Map<String, dynamic> json) {
    return Official(
        id: json['username'],
        officialnum: json['id'],
        officialName: json['username_name'],
        department: json['department']);
  }
}
