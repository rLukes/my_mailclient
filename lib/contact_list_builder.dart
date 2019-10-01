import 'package:flutter/material.dart';
import 'package:my_mailclient/model/contact.dart';
import 'package:my_mailclient/provider.dart';

import 'ContactManager.dart';

class ContactListBuilder extends StatelessWidget {
  final Function builder;

  ContactListBuilder({this.builder});

  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context);
    return StreamBuilder(
      stream: manager.contactListView,
      builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            List<Contact> contacts = snapshot.data;
            return builder(context, contacts);
          default:
            return Center(child: CircularProgressIndicator());
            break;
        }
      },
    );
  }
}
