import '../Dataprovider/members__dataprovider.dart';
import '../models/members.dart';
class MembersRepository{
  final MemberDataProvider dataProvider;
  MembersRepository(this.dataProvider);

Future<Member> create(String username, String password) async{
  return dataProvider.create(username, password);
}

Future<Member> update(String username, Member member) async{
  return dataProvider.update(username, member);

}
Future<Member> fetchuser(String username, String password) async{
  return dataProvider.fetchuser(username, password);
}
Future<void> delete(int id) async {
  dataProvider.delete(id);
}
}