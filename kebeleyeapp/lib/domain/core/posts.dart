import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../auth/officials.dart';

class Post extends Equatable {
  String postcontent;

  String? datetime;
  int? id;
  Official official;
  Post({required this.postcontent, required this.official});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(postcontent: json['post'], official: json['official']);
  }
}
