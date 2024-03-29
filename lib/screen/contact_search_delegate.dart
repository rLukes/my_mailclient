import 'package:flutter/material.dart';
import 'package:my_mailclient/manager/ContactManager.dart';
import 'package:my_mailclient/contact_list_builder.dart';
import 'package:my_mailclient/provider.dart';

class ContactSearchDelegate extends SearchDelegate {
  ContactSearchDelegate();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

    if (query.length < 3) {
      return Center(
        child: Text("Type more then tre letters"),
      );
    }
    manager.inFilter.add(query);

    return ContactListBuilder(
      stream: manager.browse$,
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
