import '../Dataprovider/official_dataprovider.dart';
import '../models/officials.dart';
class OfficialRepository{
  final OfficialDataProvider dataProvider;
  OfficialRepository(this.dataProvider);

Future<Official> create(Official official) async{
  return dataProvider.create(official);
}

Future<Official> update(String username, Official official) async{
  return dataProvider.update(username, official);

}
Future<Future<Official>> fetchByDepartment(String position) async{
  return dataProvider.fetchByDepartment(position);
}
Future<void> delete(int id) async {
  dataProvider.delete(id);
}
}