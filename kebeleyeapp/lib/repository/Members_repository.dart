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
Future<Future<Member>> fetchuser(String kebeleyeid, String password) async{
  return dataProvider.fetchuser(kebeleyeid, password);
}
Future<void> delete(int id) async {
  dataProvider.delete(id);
}
}