import 'package:equatable/equatable.dart';

abstract class AnnouncementState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}
class ClearedAnnouncementPageState extends AnnouncementState{
  
}
class PostingAnnouncementState extends AnnouncementState{}
class PostAnnouncementState extends AnnouncementState{}
class PostingSuccessfulState extends AnnouncementState{}
class FailedPostingAnnouncementState extends AnnouncementState{}