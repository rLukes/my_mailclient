import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_mailclient/Message.dart';

class MessageList extends StatefulWidget {
  final String title;
  const MessageList({Key key, this.title}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  var messages = const [];

  void loadMessageList() async{
    String content = await rootBundle.loadString('data/message.json');
    List collection = json.decode(content);

    List<Message> _messages = collection.map((m) => new Message.fromJson(m)).toList();

    setState(() {
      messages = _messages;
    });
  }

  @override
  void initState() {
    loadMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          Message message = messages[index];
          return ListTile(
            title: Text(message.subject),
            subtitle: Text(
              message.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            leading: CircleAvatar(
              child: Text("AS"),
            ),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}
