import 'package:equatable/equatable.dart';

abstract class ReportEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}
class ClearEvent extends ReportEvent{
  
  
}
class SendReportEvent extends ReportEvent{
  
}
class FetchReportsByname extends ReportEvent{

}