import 'package:equatable/equatable.dart';
import 'package:kebeleyeapp/models/members.dart';

import '../models/models.dart';

abstract class ReportEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}
class ClearReportEvent extends ReportEvent{
}

class SendReportEvent extends ReportEvent{
  final String reportcontent;
  final Official official;
  final Member user;
  SendReportEvent(this.reportcontent, this.official, this.user);
}
class MemberReportsFetchEvent extends ReportEvent{
  final Member user;
  MemberReportsFetchEvent(this.user);
}
class ToupdateReportEvent extends ReportEvent{
  final Report report;
  ToupdateReportEvent(this.report);
}
class UpdateReportEvent extends ReportEvent{
  final String postcontent;
  final Report report;
  UpdateReportEvent(this.postcontent, this.report);
}
class DeleteReportEvent extends ReportEvent{
  final Report report;
  DeleteReportEvent(this.report);
}