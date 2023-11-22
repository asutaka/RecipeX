import '../../../core/domain/usecase/use_case.dart';
import '../../entity/videoDTO.dart';
import '../../repository/post/post_repository.dart';

class GetVideoUseCase extends UseCase<ListVideoAPIDTO, void> {
  final PostRepository _postRepository;

  GetVideoUseCase(this._postRepository);

  @override
  Future<ListVideoAPIDTO> call({required params}) {
    return _postRepository.getVideo();
  }
}
