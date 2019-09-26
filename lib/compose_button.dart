import 'package:flutter/material.dart';

import 'message_compose.dart';

class ComposeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blueGrey,
      child: Icon(Icons.add),
      onPressed: () async{
        String intent = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx) {
          return MessageCompose();
        }));
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Your message has been sent with $intent"),
            backgroundColor: Colors.blueGrey,
          )
        );
      },
    );
  }
}
