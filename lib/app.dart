import 'package:flutter/material.dart';
import 'package:my_mailclient/screen/calendar_screen.dart';
import 'package:my_mailclient/screen/contact_screen.dart';
import 'package:my_mailclient/inbox_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        InboxScreen(),
        ContactScreen(),
        CalendarScreen()
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text("Inbox"),
            icon: Icon(Icons.inbox),
          ),
          BottomNavigationBarItem(
            title: Text("Contacts"),
            icon: Icon(Icons.people),
          ),
          BottomNavigationBarItem(
            title: Text("Calendar"),
            icon: Icon(Icons.calendar_today),
          )
        ],
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
