import 'package:flutter/material.dart';
import 'package:my_mailclient/ContactManager.dart';
import 'package:my_mailclient/app_drawer.dart';
import 'package:my_mailclient/contact_counter.dart';
import 'package:my_mailclient/contact_list_builder.dart';
import 'package:my_mailclient/contact_search_delegate.dart';
import 'package:my_mailclient/provider.dart';

class ContactScreen extends StatelessWidget {

 // ContactManager manager = new ContactManager();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Contact"),
        actions: <Widget>[
          ContactCounter(),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context, delegate: ContactSearchDelegate(),
              );
            },
          )
        ],
      ),
      body: ContactListBuilder(
        builder: (context, contacts) {
          return ListView.separated(
              itemBuilder: (BuildContext ctx, int index) {
                return ListTile(
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].email),
                  leading: CircleAvatar(),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: contacts?.length ?? 0);
        },
      ),
    );
  }
}
