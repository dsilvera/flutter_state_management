import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_manager/redux/models/redux_settings_model.dart';

class ReduxPage extends StatelessWidget {
  ReduxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (Store<AppState> store) => store.state,
        builder: (BuildContext context, AppState appState) => Scaffold(
              appBar: AppBar(
                backgroundColor: appState.colorSelected.color,
                title: Text("Redux Screen"),
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
                      'You select ${appState.colorSelected.name}',
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/redux/settings');
                },
                child: Icon(Icons.settings),
              ),
            ));
  }
}
