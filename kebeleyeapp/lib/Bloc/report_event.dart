import 'package:equatable/equatable.dart';

abstract class ReportEvent extends Equatable{

}
class ClearEvent extends ReportEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}
class SendReportEvent extends ReportEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}