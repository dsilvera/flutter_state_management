import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/bloc/pages/bloc_page.dart';
import 'package:state_manager/bloc/pages/bloc_settings_page.dart';
import 'package:state_manager/bloc/models/settings_cubit.dart';
import 'package:state_manager/models/color_list_model.dart';

import '../main.dart';

class BlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SettingsCubit(ColorListModel()),
        child: MaterialApp(
          title: 'Flutter Demo',
          initialRoute: '/bloc',
          routes: {
            '/bloc': (context) => BlocPage(),
            '/bloc/settings': (context) => BlocSettingsPage(),
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
