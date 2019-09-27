import 'package:flutter/material.dart';
import 'package:my_mailclient/app_drawer.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Contact"),
        ),
        body: Center(
          child: Text("contacts"),
        ),
    );
  }
}
