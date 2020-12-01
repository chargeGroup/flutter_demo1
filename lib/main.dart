import 'package:flutter/material.dart';
import 'package:flutter_demo1/WelcomePage.dart';
import 'package:flutter_demo1/screens/provider/find_list.dart';
import 'package:provider/provider.dart';
import 'screens/manager/ManagerScreen.dart';

 void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => FindListProvider()
      )
    ],
    child: App(),
  ),
);

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
