import 'package:recipe_x/domain/entity/resourceDTO.dart';
import 'package:recipe_x/domain/entity/videoDTO.dart';

import '../../../core/data/network/dio/dio_client.dart';
import '../../../domain/entity/post/post_list.dart';
import '../constants/endpoints.dart';

class PostApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  PostApi(this._dioClient);

  /// Returns list of post in response
  Future<PostList> getPosts() async {
    try {
      final res = await _dioClient.dio.get(Endpoints.getPosts);
      return PostList.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<ListVideoAPIDTO> getVideo() async {
    try {
      final res = await _dioClient.dio.get(Endpoints.api_video);
      return ListVideoAPIDTO.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<ListResourceDTO> getResource() async {
    try {
      final res = await _dioClient.dio.get(Endpoints.api_resource);
      return ListResourceDTO.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
