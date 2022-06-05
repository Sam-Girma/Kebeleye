import 'package:equatable/equatable.dart';
import '../models/officials.dart';

abstract class HomePageState extends Equatable {
  @override
  List<Object> get props => [];
}

class IdleHomepageState extends HomePageState{
  final List<Official> official;
  IdleHomepageState(this.official);
}
class FetchingallOfficialsState extends HomePageState{}
class OpeningOfficialDetailState extends HomePageState{}
class FetchingOfficialsFailed extends HomePageState{}
class FetchingPosts extends HomePageState{}
class FetchingPostsSuccessful extends HomePageState{
  final List posts;
  FetchingPostsSuccessful(this.posts);
}
class SearchingOfficialState extends HomePageState{}
class OpenEditScreenState extends HomePageState{}
class OpenFeedbackScreenState extends HomePageState{}
class OpenreportsScreenState extends HomePageState{}

