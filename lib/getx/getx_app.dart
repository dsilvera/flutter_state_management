import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_manager/getx/pages/getx_page.dart';

import '../main.dart';

class GetXApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:false,
      home: GetXPage(),
      onGenerateRoute: (settings) {
        if (settings.name == "/home") {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => MyApp(),
          );
        }
      },
    );
  }
}
