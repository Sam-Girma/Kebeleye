import 'package:kebeleyeapp/Infrastructure/core/report_data_provider.dart';

import '../../domain/auth/members.dart';
import '../../domain/core/report.dart';

class ReportRepository {
  final ReportDataProvider dataProvider;
  ReportRepository(this.dataProvider);

  Future<Report> create(Report report) async {
    return dataProvider.create(report);
  }

  Future<Report> update(String reportcontent, Report report) async {
    return dataProvider.update(reportcontent, report);
  }

  Future<List<Report>> fetchreportByuser(Member member) async {
    return dataProvider.fetchreportByuser(member);
  }

  Future<void> delete(Report report) async {
    dataProvider.delete(report);
  }
}
