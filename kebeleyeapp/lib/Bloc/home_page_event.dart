import 'package:equatable/equatable.dart';

abstract class HomePageEvent extends Equatable{}

class ExpandEvent extends HomePageEvent{
  ExpandEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class CompressEvent extends HomePageEvent{
  CompressEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}