import 'package:flutter/material.dart';
import 'package:state_manager/binder/binder_app.dart';
import 'package:state_manager/provider/provider_app.dart';
import 'package:state_manager/redux/redux_app.dart';
import 'package:state_manager/riverpod/riverpod_app.dart';
import 'package:state_manager/bloc/bloc_app.dart';
import 'package:state_manager/getx/getx_app.dart';
import 'package:state_manager/mobx/mobx_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(),
        '/provider': (context) => ProviderApp(),
        '/riverpod': (context) => RiverpodApp(),
        '/redux': (context) => ReduxApp(),
        '/bloc': (context) => BlocApp(),
        '/getx': (context) => GetXApp(),
        '/binder': (context) => BinderApp(),
        '/mobx': (context) => MobXApp(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("States Management"),
      ),
      body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainButton(label: 'provider', route: '/provider'),
                MainButton(label: 'Riverpod', route: '/riverpod'),
                MainButton(label: 'Redux', route: '/redux'),
                MainButton(label: 'BLoC', route: '/bloc'),
                MainButton(label: 'GetX', route: '/getx'),
                MainButton(label: 'Binder', route: '/binder'),
                MainButton(label: 'MobX & GetIt', route: '/mobx'),
              ],
            ),
          ),
        ),
    );
  }
}

class MainButton extends StatelessWidget {
  final String label;
  final String route;

  MainButton({Key? key, required this.label, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, route);
            },
            child: Text(
              label,
              style: TextStyle(fontSize: 30),
            )),
      ),
    );
  }
}
