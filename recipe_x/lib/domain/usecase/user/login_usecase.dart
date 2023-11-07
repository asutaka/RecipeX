import '../../../core/domain/usecase/use_case.dart';
import '../../entity/user/login_param.dart';
import '../../entity/user/user.dart';
import '../../repository/user/user_repository.dart';

class LoginUseCase implements UseCase<User?, LoginParams> {
  final UserRepository _userRepository;

  LoginUseCase(this._userRepository);

  @override
  Future<User?> call({required LoginParams params}) async {
    return _userRepository.login(params);
  }
}
