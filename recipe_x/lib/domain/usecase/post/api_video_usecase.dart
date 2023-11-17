import '../../../core/domain/usecase/use_case.dart';
import '../../entity/video_api_dto.dart';
import '../../repository/post/post_repository.dart';

class APIVideoUseCase extends UseCase<VideoAPIDTO_List, void> {
  final PostRepository _postRepository;

  APIVideoUseCase(this._postRepository);

  @override
  Future<VideoAPIDTO_List> call({required params}) {
    return _postRepository.getVideo();
  }
}
