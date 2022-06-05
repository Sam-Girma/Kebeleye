import 'package:equatable/equatable.dart';
import 'package:kebeleyeapp/models/models.dart';

abstract class AnnouncementEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class PostEvent extends AnnouncementEvent{
  final String postcontent;
  final Official official;
  PostEvent(this.postcontent, this.official);
  
}