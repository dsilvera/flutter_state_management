import 'package:flutter/material.dart';
import 'package:state_manager/binder/models/settings_controller.dart';
import 'package:binder/binder.dart';

class BinderPage extends StatefulWidget {
  BinderPage({Key? key}) : super(key: key);

  @override
  _BinderPageState createState() => _BinderPageState();
}

class _BinderPageState extends State<BinderPage> {
  @override
  Widget build(BuildContext context) {
    final settings = context.watch(settingsRef);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: settings.color,
        title: Text("Binder Screen"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/home');
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You select ${settings.name}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/binder/settings');
        },
        child: Icon(Icons.settings),
      ),
    );
  }
}
