import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_manager/redux/pages/redux_page.dart';
import 'package:state_manager/redux/pages/redux_settings_page.dart';
import 'package:state_manager/redux/reducers.dart';

import '../main.dart';
import 'models/redux_settings_model.dart';

class ReduxApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: this.store,
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            initialRoute: '/redux',
            routes: {
              '/redux': (context) => ReduxPage(),
              '/redux/settings': (context) => ReduxSettingsPage(),
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
