import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("demo@email.com"),
            accountName: Text("User"),
            currentAccountPicture: CircleAvatar(
              child: Text("A"),
            ),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                child: CircleAvatar(
                  child: Icon(Icons.add),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Adding new acount...."),
                        );
                      });
                },
              )
            ],
          ),
          ListTile(
              leading: Icon(FontAwesomeIcons.inbox),
              title: Text("Inbox"),
              trailing: Chip(
                label: Text("11"),
                backgroundColor: Colors.grey,
              )),
          ListTile(
            leading: Icon(FontAwesomeIcons.edit),
            title: Text("Draft"),
          ),
          ListTile(
            title: Text("Archive"),
            leading: Icon(FontAwesomeIcons.archive),
          ),
          ListTile(
            title: Text("Sent"),
            leading: Icon(FontAwesomeIcons.paperPlane),
          ),
          ListTile(
            title: Text("Trash"),
            leading: Icon(FontAwesomeIcons.trash),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(FontAwesomeIcons.cog),
              ),
            ),
          )
        ],
      ),
    );
  }
}
