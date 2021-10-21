import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager/provider/models/provider_settings_model.dart';

class ProviderPage extends StatefulWidget {
  ProviderPage({Key? key}) : super(key: key);

  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSettingsModel>(
      builder: (context, settings, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: settings.colorSelected,
            title: Text("Provider Screen"),
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
              Navigator.pushNamed(context, '/provider/settings');
            },
            child: Icon(Icons.settings),
          ),
        );
      },
    );
  }
}
