import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:equatable/equatable.dart';

class Member extends Equatable {
  Member(
      {this.id,
      required this.membernum,
      required this.username,
      required this.imageurl,
      this.password});
  String? id;
  int membernum;
  String username;
  String imageurl;
  String? password;
  @override
  List<Object> get props => [];

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
        id: json['username'],
        membernum: json['id'],
        username: json['username_name'],
        imageurl: json['image']);
  }
}
