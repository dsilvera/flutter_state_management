import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:state_manager/mobx/models/settings_store.dart';

import '../main.dart';
import 'pages/mobx_page.dart';
import 'pages/mobx_settings_page.dart';

class MobXApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetIt getIt = GetIt.I;
    getIt.registerSingleton(SettingsStore());
    return BinderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: '/mobx',
        routes: {
          '/mobx': (context) => MobXPage(),
          '/mobx/settings': (context) => MobXSettingsPage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == "/home") {
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => MyApp(),
            );
          }
        },
      ),
    );
  }
}
