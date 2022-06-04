import 'package:equatable/equatable.dart';
import 'package:kebeleyeapp/models/models.dart';

abstract class HomePageEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchallOfficialsEvent extends HomePageEvent {}

class OpenOfficialPageEvent extends HomePageEvent {}

class SearchEvent extends HomePageEvent {}

class OpenreportsEvent extends HomePageEvent {}

class OpenFeedbackEvent extends HomePageEvent {}

class OpenEditScreenEvent extends HomePageEvent {}

class LogooutEvent extends HomePageEvent {}

class FetchOfficialPostsEvent extends HomePageEvent {
  final Official official;
  FetchOfficialPostsEvent(this.official);
}
