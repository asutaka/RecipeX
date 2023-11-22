import 'package:recipe_x/domain/entity/video_api_dto.dart';

import '../../entity/post/post.dart';
import '../../entity/post/post_list.dart';

abstract class PostRepository {
  Future<PostList> getPosts();

  Future<List<Post>> findPostById(int id);

  Future<int> insert(Post post);

  Future<int> update(Post post);

  Future<int> delete(Post post);

  Future<ListVideoAPIDTO> getVideo();
}
