import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  final String title;
  final String content;
  CustomScreen(this.title, { this.content });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(content),
      )
    );
  }
}
