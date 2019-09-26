import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_mailclient/Message.dart';
import 'package:my_mailclient/compose_button.dart';
import 'package:my_mailclient/message_detail.dart';

class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> future;
  List<Message> messages;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    future = Message.browse();
    messages = await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
                  onTap: (){
                    showDialog(context: context,
                    builder: (context){
                      return AlertDialog(title: Text("Adding new acount...."),);
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
              )
            ),
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
      ),
      floatingActionButton: ComposeButton(messages),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              var _messages = await Message.browse();
              setState(() {
                messages = _messages;
              });
            },
          )
        ],
      ),
      body: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) return Text("Erro!!");

                var messages = snapshot.data;
                return ListView.separated(
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext ctx) =>
                                  MessageDetail(message.subject, message.body),
                            ),
                          );
                        });
                  },
                );
            }
          }),
    );
  }
}
