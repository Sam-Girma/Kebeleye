import 'package:equatable/equatable.dart';

abstract class EditScreenState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class ClearedEditaccountState extends EditScreenState{}
class EditingState extends EditScreenState{
  
}
class EditingCompletedState extends EditScreenState{}
class EditingFailedState extends EditScreenState{}