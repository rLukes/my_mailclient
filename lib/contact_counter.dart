import 'package:flutter/material.dart';
import 'package:my_mailclient/ContactManager.dart';
import 'package:my_mailclient/overseer.dart';
import 'package:my_mailclient/provider.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

    return
      StreamBuilder<int>(
        stream: manager.contactCount,
        builder: (BuildContext context, snapshot) {
          return Chip(
            label: Text(
              (snapshot.data ?? 0).toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            backgroundColor: Colors.grey,
          );
        },
      );
  }
}

