import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:equatable/equatable.dart';

class Official extends Equatable{
  Official({this.id, required this.officialName, required this.position,required this.offcialimageurl});
  String? id;
  String officialName;
  String position;
  String offcialimageurl;
  
  @override
List<Object> get props => [officialName,  position, offcialimageurl];

  factory Official.fromJson(Map<String, dynamic> json){
    return Official(officialName: json['username'], position: json['position'], offcialimageurl: json['image']);
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