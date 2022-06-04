import 'package:kebeleyeapp/models/members.dart';

import '../Dataprovider/official_dataprovider.dart';
import '../Dataprovider/report_data_provider.dart';
import '../models/report.dart';
class ReportRepository{
  final ReportDataProvider dataProvider;
  ReportRepository(this.dataProvider);

Future<Report> create(Report report) async{
  return dataProvider.create(report);
}

Future<Report> update(String reportcontent, Report report) async{
  return dataProvider.update(reportcontent, report);

}

Future<List<Report>> fetchreportByuser(Member user) async{
  return dataProvider.fetchreportByuser(user);
}
Future<void> delete(Report report) async {
  dataProvider.delete(report);
}

  
}