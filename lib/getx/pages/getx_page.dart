import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_manager/getx/models/settings_controller.dart';

import '../../main.dart';
import 'getx_settings_page.dart';

class GetXPage extends StatefulWidget {
  GetXPage({Key? key}) : super(key: key);

  @override
  _GetXPageState createState() => _GetXPageState();
}

class _GetXPageState extends State<GetXPage> {
  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: GetBuilder<SettingsController>(
              builder: (_) => AppBar(
                    backgroundColor: controller.colorSelected,
                    title: Text("GetX Screen"),
                    actions: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                            Get.to(MyApp());
                          },
                          icon: Icon(Icons.home))
                    ],
                  ))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GetBuilder<SettingsController>(
                builder: (_) => Text(
                      'You select ${controller.colorSelectedName}',
                    )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(GetXSettingsPage());
        },
        child: Icon(Icons.settings),
      ),
    );
  }
}
