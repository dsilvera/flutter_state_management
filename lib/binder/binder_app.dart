import 'package:binder/binder.dart';
import 'package:flutter/material.dart';
import 'package:state_manager/binder/pages/binder_page.dart';
import 'package:state_manager/binder/pages/binder_settings_page.dart';

import '../main.dart';

class BinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BinderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: '/binder',
        routes: {
          '/binder': (context) => BinderPage(),
          '/binder/settings': (context) => BinderSettingsPage(),
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
