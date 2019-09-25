import 'package:flutter/material.dart';

void main() => runApp(MyEmailApp());

class MyEmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emial app',
      theme: ThemeData(primarySwatch: Colors.blueGrey, accentColor: Colors.red),
      home: MyEmailHomePage("My Email"),
    );
  }
}

class MyEmailHomePage extends StatelessWidget {
  final String title;
  var messages = const [
    'my frist message',
    'my seconde message',
    'My new message'
  ];

  MyEmailHomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.separated(
            itemCount: messages.length,
            separatorBuilder: (context, index){
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              var title = messages[index];
              return ListTile(
                title: Text(title),
                subtitle: Text("Another text"),
                leading: CircleAvatar(
                  child: Text("AS"),
                ),
                isThreeLine: true,
              );
            }));
  }
}
