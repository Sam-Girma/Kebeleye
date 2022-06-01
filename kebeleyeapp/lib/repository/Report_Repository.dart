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
Future<Future<Report>> fetchByDepartment(bool is_report) async{
  return dataProvider.fetchByboolian(is_report);
}
Future<void> delete(int id) async {
  dataProvider.delete(id);
}
}