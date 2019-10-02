import 'package:flutter/material.dart';
import 'package:my_mailclient/Message.dart';

import 'screen/message_compose.dart';

class ComposeButton extends StatelessWidget {
  List<Message> messages;
  ComposeButton(this.messages);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blueGrey,
      child: Icon(Icons.add),
      onPressed: () async {
        Message newMessage = await Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext ctx) {
          return MessageCompose();
        }));
        if (newMessage != null) {
          messages.add(newMessage);
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Your message has been sent"),
            backgroundColor: Colors.blueGrey,
          ));
        }
      },
    );
  }
}