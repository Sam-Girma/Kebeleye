import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {
 
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Changepage extends BottomNavigationEvent {
  final int index;
  final String kebeleid;

  Changepage({required this.index, required this.kebeleid});

  @override
  String toString() => 'PageTapped: $index';
}
