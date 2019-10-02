import 'package:flutter/material.dart';
import 'package:my_mailclient/manager/ContactManager.dart';
import 'package:my_mailclient/Observer.dart';

import 'package:my_mailclient/provider.dart';

class ContactCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ContactManager manager = Provider.of(context).fetch(ContactManager);

    return Observer<int>(
      stream: manager.count$,
      onSuccess: (BuildContext context, data) {
        return Chip(
          label: Text(
            (data ?? 0).toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.grey,
        );
      },
    );
  }
}
