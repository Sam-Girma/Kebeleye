import 'package:kebeleyeapp/models/models.dart';

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
Future<List<Post>> fetchByOfficial(Official official) async{
  return dataProvider.fetchByofficial(official);
}
Future<void> delete(Post post) async {
  dataProvider.delete(post);
}
}