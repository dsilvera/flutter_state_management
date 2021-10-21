import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager/provider/pages/provider_page.dart';
import 'package:state_manager/provider/pages/provider_settings_page.dart';

import '../main.dart';
import '../models/color_list_model.dart';
import 'models/provider_settings_model.dart';

class ProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => ColorListModel()),
          ChangeNotifierProvider(create: (context) => ProviderSettingsModel())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: '/provider',
          routes: {
            '/provider': (context) => ProviderPage(),
            '/provider/settings': (context) => ProviderSettingsPage(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == "/home") {
              return PageRouteBuilder(
                settings: settings,
                pageBuilder: (_, __, ___) => MyApp(),
              );
            }
          },
        ));
  }
}
