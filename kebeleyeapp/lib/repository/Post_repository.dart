import '../Dataprovider/posts_data_provider.dart';
import '../models/posts.dart';
class PostRepository{
  final PostDataProvider dataProvider;
  PostRepository(this.dataProvider);

Future<Post> create(Post post) async{
  return dataProvider.create(post);
}

Future<Post> update(String postcontent, Post post) async{
  return dataProvider.update(postcontent, post);

}
Future<Future<Post>> fetchByOfficial(String official) async{
  return dataProvider.fetchByOfficial(official);
}
Future<void> delete(int id) async {
  dataProvider.delete(id);
}
}