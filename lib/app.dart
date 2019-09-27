import 'package:flutter/material.dart';
import 'package:my_mailclient/app_drawer.dart';
import 'package:my_mailclient/message_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(

        appBar: AppBar(
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
              Tab(text: "Other",)
            ],
          ),
        ),
        drawer:AppDrawer(),
        body: TabBarView(
          children: <Widget>[
            MessageList(status: 'important'),
            MessageList(status: 'other')
          ],
        ),
      ),
      length: 2,
    );
  }
}
