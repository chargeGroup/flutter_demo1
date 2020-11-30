import 'package:flutter/material.dart';
import 'package:flutter_demo1/WelcomePage.dart';
import 'screens/manager/ManagerScreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomePage(),
      routes: {
        '/manager': (BuildContext conext) {
          return ManagerScreen();
        }
      },
    );
  }
}
