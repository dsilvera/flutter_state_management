import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/models/color_list_model.dart';

import '../models/settings_cubit.dart';

class BlocPage extends StatefulWidget {
  BlocPage({Key? key}) : super(key: key);

  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, Item>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: state.color,
            title: Text("Bloc Screen"),
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
                  'You select ${state.name}',
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/bloc/settings');
            },
            child: Icon(Icons.settings),
          ),
        );
      },
    );
  }
}
