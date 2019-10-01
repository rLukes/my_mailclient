import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:my_mailclient/model/contact.dart';
import 'package:my_mailclient/service/conctac_service.dart';

class ContactManager{
  final BehaviorSubject<int> _contactCount = BehaviorSubject<int>();
  Stream<int> get contactCount => _contactCount.stream;
  
  Stream<List<Contact>> get contactListView {
    return Stream.fromFuture(ContactService.browse());
  }

  Stream<List<Contact>> filteredCollection ({query}) {
    return Stream.fromFuture(ContactService.browse(query:query));
  }

  ContactManager(){
    contactListView.listen((list) => _contactCount.add(list.length));
  }

  void dispose(){
    _contactCount.close();
  }
}