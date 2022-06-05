import 'package:kebeleyeapp/Infrastructure/core/posts_data_provider.dart';

import '../../domain/auth/officials.dart';
import '../../domain/core/posts.dart';

class PostRepository {
  final PostDataProvider dataProvider;
  PostRepository(this.dataProvider);

  Future<Future> create(Post post) async {
    return dataProvider.create(post);
  }

  Future<Future> update(String postcontent, Post post) async {
    return dataProvider.update(postcontent, post);
  }

  Future<Future<List>> fetchByOfficial(Official official) async {
    return dataProvider.fetchByofficial(official);
  }

  Future<void> delete(Post post) async {
    dataProvider.delete(post);
  }
}
