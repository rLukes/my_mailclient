import 'package:flutter/material.dart';
import 'package:my_mailclient/ContactManager.dart';
import 'package:my_mailclient/provider.dart';
import 'app.dart';

void main() => runApp(MyEmailApp());

class MyEmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: ContactManager(),
      child: MaterialApp(
        title: 'Emial app',
        theme: ThemeData(primarySwatch: Colors.blueGrey, accentColor: Colors.red),
        home: App()
      ),
    );
  }
}

