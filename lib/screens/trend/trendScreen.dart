import 'package:flutter/material.dart';

class TrendScreen extends StatelessWidget {
  const TrendScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('好友'),
      ),
      body: Center(
        child: Text('好友页面'),
      ),
    );
  }
}