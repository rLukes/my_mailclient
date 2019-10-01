import 'package:flutter/material.dart';
import 'package:my_mailclient/Observer.dart';
import 'package:my_mailclient/model/contact.dart';

class ContactListBuilder extends StatelessWidget {
  final Function builder;
  final Stream stream;

  ContactListBuilder({this.builder, this.stream});

  @override
  Widget build(BuildContext context) {
    return Observer<List<Contact>>(
      stream: stream,
      onSuccess: (BuildContext context, List<Contact> data) {
        return builder(context, data);
      },
      onWaiting: (context) =>  LinearProgressIndicator(),
    );
  }
}
