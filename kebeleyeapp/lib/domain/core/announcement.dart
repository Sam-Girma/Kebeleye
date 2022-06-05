
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Post extends Equatable{
  String postcontent;
  String datetime;
  bool? is_report = false;
  bool? is_announcement = false;
  bool? is_post = true;
  Post({required this.postcontent, required this.datetime});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(postcontent: json['postcontent'], datetime: json['datetime']);
  }

}


