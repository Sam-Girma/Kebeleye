import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:equatable/equatable.dart';

class Official extends Equatable{
  Official({this.id, required this.officialName, required this.department});
  String? id;
  String officialName;
  String department;
  
  
  @override
List<Object> get props => [officialName,  department];

  factory Official.fromJson(Map<String, dynamic> json){
    return Official(officialName: json['username'], department: json['department']);
  }

  
}



// factory Official.fromJson(Map<String, dynamic> json){
//   return Official(officialName: json['name'], position: json['position'], offcialimageurl: json['officialimageurl']);
// }
// @override
// String toString() => 'Official { officialname: $officialname, position: $position, imageurl: $offcialimageurl }';

// final List<Official> officials=[
//   Official("Ato Abebe Kebede", "Kebele head", "assets/profile_picture.png"),
//   Official("Ato Belete Sisay", "Kebele vice", "assets/profile_picture.png"),
//   Official("Wezero Hirut Gemeda", "Kebele consultant", "assets/profile_picture.png"),
//   Official("Ato Shambel Kebede", "Kebele head", "assets/profile_picture.png"),
//   Official("Ato Saka Sisay", "Kebele vice", "assets/profile_picture.png"),
//   Official("Wezero Drogba Gemeda", "Kebele consultant", "assets/profile_picture.png"),

// ];