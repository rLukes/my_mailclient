import 'package:flutter/material.dart';
import 'package:my_mailclient/app_drawer.dart';
import 'package:my_mailclient/compose_button.dart';
import 'package:my_mailclient/message_list.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("MYEmailApp"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {},
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Importent",
              ),
              Tab(
                text: "Other",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MessageList(status: 'important'),
            MessageList(status: 'other')
          ],
        ),
        floatingActionButton: ComposeButton([]),
      ),
    );
  }
}
