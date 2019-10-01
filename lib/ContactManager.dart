import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:my_mailclient/model/contact.dart';
import 'package:my_mailclient/service/conctac_service.dart';

class ContactManager{
  final BehaviorSubject<int> _contactCount = BehaviorSubject<int>();
  Stream<int> get count$ => _contactCount.stream;
  

  Stream<List<Contact>> browse$ ({String query}) {
    return Stream.fromFuture(ContactService.browse(query:query));
  }

  ContactManager(){
    browse$().listen((list) => _contactCount.add(list.length));
  }

  void dispose(){
    _contactCount.close();
  }
}