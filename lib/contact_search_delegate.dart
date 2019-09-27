import 'package:flutter/material.dart';
import 'package:my_mailclient/ContactManager.dart';
import 'package:my_mailclient/contact_list_builder.dart';


class ContactSearchDelegate extends SearchDelegate {
  final ContactManager manager;

  ContactSearchDelegate(this.manager);

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
    if (query.length < 3) {
      return Center(
        child: Text("Type more then tre letters"),
      );
    } else {
      return ContactListBuilder(
        stream: manager.filteredCollection(query: query),
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
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
