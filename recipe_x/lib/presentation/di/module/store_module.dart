import 'package:recipe_x/domain/usecase/post/get_video_usecase.dart';

import '../../../core/data/sharedpref/getItInstance.dart';
import '../../../core/stores/error/error_store.dart';
import '../../../core/stores/form/form_store.dart';
import '../../../domain/usecase/post/get_post_usecase.dart';
import '../../../domain/usecase/post/get_resource_usecase.dart';
import '../../../domain/usecase/user/is_logged_in_usecase.dart';
import '../../../domain/usecase/user/login_usecase.dart';
import '../../../domain/usecase/user/save_login_in_status_usecase.dart';
import '../../login/store/login_store.dart';
import '../../post/store/post_store.dart';

mixin StoreModule {
  static Future<void> configureStoreModuleInjection() async {
    // factories:---------------------------------------------------------------
    getIt.registerFactory(() => ErrorStore());
    getIt.registerFactory(() => FormErrorStore());
    getIt.registerFactory(
      () => FormStore(getIt<FormErrorStore>(), getIt<ErrorStore>()),
    );

    // stores:------------------------------------------------------------------
    getIt.registerSingleton<UserStore>(
      UserStore(
        getIt<IsLoggedInUseCase>(),
        getIt<SaveLoginStatusUseCase>(),
        getIt<LoginUseCase>(),
        getIt<FormErrorStore>(),
        getIt<ErrorStore>(),
      ),
    );

    getIt.registerSingleton<PostStore>(
      PostStore(
        getIt<GetPostUseCase>(),
        getIt<GetVideoUseCase>(),
        getIt<GetResourceUseCase>(),
        getIt<ErrorStore>(),
      ),
    );
  }
}
