import 'package:flutter/material.dart';

import 'Message.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String to = "";
  String subject = "";
  String body = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new message"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  labelText: 'To',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                onChanged: (value) {
                  to = value;
                },
              ),
            ),
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  labelText: 'Subject',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                onChanged: (value) {
                  subject = value;
                },
              ),
            ),
            Divider(),
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  labelText: 'Body',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                maxLines: 8,
                onChanged: (value) {
                  body = value;
                },
              ),
            ),
            ListTile(
              title: RaisedButton(
                onPressed: () {
                 Message newMessage = new Message(subject, body);
                 Navigator.pop(context, newMessage);
                },
                child: Text("Send"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
