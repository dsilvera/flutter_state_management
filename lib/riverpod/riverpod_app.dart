import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_manager/riverpod/pages/riverpod_page.dart';
import 'package:state_manager/riverpod/pages/riverpod_settings_page.dart';

import '../main.dart';

class RiverpodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            initialRoute: '/riverpod',
            routes: {
              '/riverpod': (context) => RiverpodPage(),
              '/riverpod/settings': (context) => RiverpodSettingsPage(),
            },
            onGenerateRoute: (settings) {
              if (settings.name == "/home") {
                return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (_, __, ___) => MyApp(),
                );
              }
            }));
  }
}
