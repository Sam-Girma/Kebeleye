import 'package:equatable/equatable.dart';
import 'package:kebeleyeapp/pages/officials_model_to_display_on_members_home_page.dart';

abstract class HomePageState extends Equatable {
  @override
  List<Object> get props => [];
}

class CompressedState extends HomePageState {
  //final String department;
  CompressedState();
}

class ExpandLoading extends HomePageState {}

class ExpandedState extends HomePageState {
  final List<Official> officials;
  ExpandedState([this.officials = const []]);
}

class Expandedfailed extends HomePageState {
  Expandedfailed(Object error);
}
