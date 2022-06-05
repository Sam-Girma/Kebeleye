import 'package:equatable/equatable.dart';

import '../models/models.dart';

abstract class EditAccountEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
// ignore: must_be_immutable
class EditMemberpassword extends EditAccountEvent{
  String password;
  Member member;
  EditMemberpassword(this.password, this.member);
  
}
// ignore: must_be_immutable
class EditOfficialpassword extends EditAccountEvent{
  String password;
  Official official;
  EditOfficialpassword(this.password, this.official);
}