import '../Dataprovider/members__dataprovider.dart';
import '../models/members.dart';
class MembersRepository{
  final MemberDataProvider dataProvider;
  MembersRepository(this.dataProvider);

Future<Member> create(Member member) async{
  return dataProvider.create(member);
}

Future<Member> update(String username, Member member) async{
  return dataProvider.update(username, member);

}
Future<Future<Member>> fetchByDepartment(String position) async{
  return dataProvider.fetchByDepartment(position);
}
Future<void> delete(int id) async {
  dataProvider.delete(id);
}
}