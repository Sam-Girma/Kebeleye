import 'package:equatable/equatable.dart';
import 'package:kebeleyeapp/pages/officials_model_to_display_on_members_home_page.dart';

abstract class HomePageState extends Equatable {
  @override
  List<Object> get props => [];
}

class IdleHomepageState extends HomePageState{}
class FetchingallOfficialsState extends HomePageState{}
class OpeningOfficialDetailState extends HomePageState{}
class FetchingOfficialsFailed extends HomePageState{}
class FetchingPosts extends HomePageState{}
class FetchingPostsSuccessful extends HomePageState{
  final List posts;
  FetchingPostsSuccessful(this.posts);
}
class OpenEditScreenState extends HomePageState{}
class OpenFeedbackScreenState extends HomePageState{}
class OpenreportsScreenState extends HomePageState{}

