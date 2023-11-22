import '../../../core/domain/usecase/use_case.dart';
import '../../entity/resourceDTO.dart';
import '../../repository/post/post_repository.dart';

class GetResourceUseCase extends UseCase<ListResourceDTO, void> {
  final PostRepository _postRepository;

  GetResourceUseCase(this._postRepository);

  @override
  Future<ListResourceDTO> call({required params}) {
    return _postRepository.getResource();
  }
}
