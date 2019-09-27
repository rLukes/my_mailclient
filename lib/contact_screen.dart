import 'package:flutter/material.dart';
import 'package:my_mailclient/ContactManager.dart';
import 'package:my_mailclient/app_drawer.dart';
import 'package:my_mailclient/model/contact.dart';

class ContactScreen extends StatelessWidget {
  ContactManager manger = new ContactManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Contact"),
        actions: <Widget>[
          StreamBuilder<int>(
              stream: manger.contactCount,
              builder: (BuildContext context, snapshot) {
                return Chip(
                  label: Text(
                    (snapshot.data ?? 0).toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  backgroundColor: Colors.grey,
                );
              })
        ],
      ),
      body: StreamBuilder(
        stream: manger.contactListView,
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());

            case ConnectionState.done:
              List<Contact> contacts = snapshot.data;
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
            default:
              return Center(child: CircularProgressIndicator());
              break;
          }
        },
      ),
    );
  }
}
