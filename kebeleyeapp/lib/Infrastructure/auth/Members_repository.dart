import '../../domain/auth/members.dart';
import 'members__dataprovider.dart';

class MembersRepository {
  final MemberDataProvider dataProvider;
  MembersRepository(this.dataProvider);

  Future<Member> create(String username, String password, String id) async {
    return dataProvider.create(id, username, password);
  }

  Future<Member> update(String username, Member member) async {
    return dataProvider.update(username, member);
  }

  Future<Member> fetchuser(String username, String password) async {
    return dataProvider.fetchuser(username, password);
  }

  Future<void> delete(Member user) async {
    dataProvider.delete(user);
  }
}
