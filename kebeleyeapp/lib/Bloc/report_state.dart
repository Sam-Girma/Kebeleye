import 'package:equatable/equatable.dart';

abstract class ReportState extends Equatable{
@override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}
class ClearedState extends ReportState{
  
}
class SendingReportState extends ReportState{
  
}
class SendingSuccessfulState extends ReportState{
  
}

class FetchingfeedState extends ReportState{

}
class FetchedfeedState extends ReportState{
  final List fetchedData;
  FetchedfeedState(this.fetchedData);
}