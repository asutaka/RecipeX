import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../constants/strings.dart';
import '../core/data/sharedpref/getItInstance.dart';
import '../utils/locale/app_localization.dart';
import '../utils/routes/routes.dart';
import 'home/home.dart';
import 'login/login.dart';
import 'login/store/login_store.dart';

class MyApp extends StatelessWidget {
  final UserStore _userStore = getIt<UserStore>();
//
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          routes: Routes.routes,
          localizationsDelegates: [
            // A class which loads the translations from JSON files
            AppLocalizations.delegate,
          ],
          home: _userStore.isLoggedIn ? HomeScreen() : LoginScreen(),
        );
      },
    );
  }
}
