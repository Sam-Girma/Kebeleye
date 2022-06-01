import 'package:equatable/equatable.dart';

abstract class ReportState extends Equatable{

}
class ClearedState extends ReportState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}
class SendingReportState extends ReportState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class SendingSuccessfulState extends ReportState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}