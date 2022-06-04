import '../Dataprovider/official_dataprovider.dart';
import '../models/officials.dart';
class OfficialRepository{
  final OfficialDataProvider dataProvider;
  OfficialRepository(this.dataProvider);

Future<Official> create(String username, String department, String password) async{
  return dataProvider.create(username, department, password);
}

Future<Official> update(String username, Official official) async{
  return dataProvider.update(username, official);

}
Future<List<Official>> fetchall() async{
  return dataProvider.fetchall();
}
Future<void> delete(int id) async {
  dataProvider.delete(id);
}

Future<Official> fetchOfficial(String username, String password) async{
  return dataProvider.fetchOfficial(username,password);
}
}