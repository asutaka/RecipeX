import '../../../core/data/sharedpref/getItInstance.dart';
import '../../../domain/repository/post/post_repository.dart';
import '../../../domain/repository/user/user_repository.dart';
import '../../local/datasources/post/post_datasource.dart';
import '../../network/apis/post_api.dart';
import '../../repository/post/post_repository_impl.dart';
import '../../repository/user/user_repository_impl.dart';
import '../../sharedpref/shared_preference_helper.dart';

mixin RepositoryModule {
  static Future<void> configureRepositoryModuleInjection() async {
    // repository:--------------------------------------------------------------
    getIt.registerSingleton<UserRepository>(UserRepositoryImpl(
      getIt<SharedPreferenceHelper>(),
    ));

    getIt.registerSingleton<PostRepository>(PostRepositoryImpl(
      getIt<PostApi>(),
      getIt<PostDataSource>(),
    ));
  }
}
