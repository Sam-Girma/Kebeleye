import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class BottomNavigationState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CurrentIndexChanged extends BottomNavigationState {}

class PageLoading extends BottomNavigationState {}

class PostPageLoaded extends BottomNavigationState {
  final List posts;
  PostPageLoaded({this.posts = const []});
}

class FeedbackpageLoaded extends BottomNavigationState {}

class ReportPageLoaded extends BottomNavigationState {}

class Loadfailed extends BottomNavigationState {
  Loadfailed(Object error);
}
