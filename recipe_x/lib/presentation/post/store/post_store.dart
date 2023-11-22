import 'package:mobx/mobx.dart';
import 'package:recipe_x/domain/usecase/post/get_resource_usecase.dart';

import '../../../core/stores/error/error_store.dart';
import '../../../domain/entity/post/post_list.dart';
import '../../../domain/entity/resourceDTO.dart';
import '../../../domain/entity/videoDTO.dart';
import '../../../domain/usecase/post/get_video_usecase.dart';
import '../../../domain/usecase/post/get_post_usecase.dart';
import '../../../utils/dio/dio_error_util.dart';
part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  // constructor:---------------------------------------------------------------
  _PostStore(
      this._getPostUseCase, this._getVideo, this._getResource, this.errorStore);

  // use cases:-----------------------------------------------------------------
  final GetPostUseCase _getPostUseCase;
  final GetVideoUseCase _getVideo;
  final GetResourceUseCase _getResource;

  // stores:--------------------------------------------------------------------
  // store for handling errors
  final ErrorStore errorStore;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<PostList?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<PostList?> fetchPostsFuture =
      ObservableFuture<PostList?>(emptyPostResponse);

  @observable
  PostList? postList;

  static ObservableFuture<ListVideoAPIDTO?> emptyVideoResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ListVideoAPIDTO?> fetchVideosFuture =
      ObservableFuture<ListVideoAPIDTO?>(emptyVideoResponse);

  @observable
  ListVideoAPIDTO? lVideo;

  static ObservableFuture<ListResourceDTO?> emptyResourceResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ListResourceDTO?> fetchResourcesFuture =
      ObservableFuture<ListResourceDTO?>(emptyResourceResponse);

  @observable
  ListResourceDTO? lResource;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future getPosts() async {
    final future = _getPostUseCase.call(params: null);
    fetchPostsFuture = ObservableFuture(future);

    future.then((postList) {
      this.postList = postList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future getVideo() async {
    final future = _getVideo.call(params: null);
    future.then((data) {
      lVideo = data;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future getResource() async {
    final future = _getResource.call(params: null);
    future.then((data) {
      lResource = data;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
