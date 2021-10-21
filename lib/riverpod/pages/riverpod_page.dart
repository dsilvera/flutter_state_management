import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

class RiverpodPage extends ConsumerWidget {
  RiverpodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final settings = watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: settings.colorSelected,
        title: Text("Riverpod Screen"),
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
              'You select ${settings.colorSelectedName}',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/riverpod/settings');
        },
        child: Icon(Icons.settings),
      ),
    );
  }
}
