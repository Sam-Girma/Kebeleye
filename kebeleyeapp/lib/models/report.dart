import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

class Report extends Equatable{
  String reportcontent;
  String datetime;
  bool is_report = true;
  bool is_announcement = false;
  bool is_post = false;
  Report({required this.reportcontent, required this.datetime});

  @override
  // TODO: implement props
  List<Object?> get props => [];

  factory Report.fromJson(Map<String, dynamic> json){
    return Report(reportcontent: json['reportcontent'], datetime: json['datetime']);
  }
}



