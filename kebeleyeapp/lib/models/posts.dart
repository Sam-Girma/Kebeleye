
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:kebeleyeapp/models/models.dart';

class Post extends Equatable{
  String postcontent;
  Official official;
  
  Post({required this.postcontent, required this.official});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
  factory Post.fromJson(Map<String, dynamic> json){
    return Post(postcontent: json['postcontent'], official: json['official']);
  }

}


