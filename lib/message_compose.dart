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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new message"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: TextFormField(
                  onSaved: (value) {
                    to = value;
                  },
                  validator: (value) {
                    if (!value.contains('@')) {
                      return "To must be a valid email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'To',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  validator: (value){
                    if(value.length == 0){
                      return "subject cannot be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Subject',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onSaved: (value) => subject = value,
                ),
              ),
              Divider(),
              ListTile(
                title: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Body',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  maxLines: 8,
                  onSaved: (value) => body = value,
                ),
              ),
              ListTile(
                title: RaisedButton(
                  onPressed: () {
                    if (this.formKey.currentState.validate()) {
                      this.formKey.currentState.save();
                      Message newMessage = new Message(subject, body);
                      Navigator.pop(context, newMessage);
                    }
                  },
                  child: Text("Send"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
