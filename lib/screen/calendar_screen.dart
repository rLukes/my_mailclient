import 'package:flutter/material.dart';
import 'package:my_mailclient/FabButton.dart';
import 'package:my_mailclient/app_drawer.dart';
import 'package:my_mailclient/counter.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Calendar"),
        ),
        body: Center(
          child: Counter(),
        ),
        floatingActionButton: FabButton(),
    );
  }
}
