import 'package:flutter/material.dart';
import 'app.dart';

void main() => runApp(MyEmailApp());

class MyEmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emial app',
      theme: ThemeData(primarySwatch: Colors.blueGrey, accentColor: Colors.red),
      home: App()
    );
  }
}

