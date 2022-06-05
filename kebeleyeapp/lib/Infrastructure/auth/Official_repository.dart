import '../../domain/auth/officials.dart';
import 'official_dataprovider.dart';

class OfficialRepository {
  final OfficialDataProvider dataProvider;
  OfficialRepository(this.dataProvider);

  Future<Official> create(String kebeleyeId, String username, String department,
      String password) async {
    return dataProvider.create(kebeleyeId, username, department, password);
  }

  Future<Official> update(String username, Official official) async {
    return dataProvider.update(username, official);
  }

  Future<List<Official>> fetchall() async {
    return dataProvider.fetchall();
  }

  Future<void> delete(Official official) async {
    dataProvider.delete(official);
  }

  Future<Official> fetchOfficial(String username, String password) async {
    return dataProvider.fetchOfficial(username, password);
  }
}
