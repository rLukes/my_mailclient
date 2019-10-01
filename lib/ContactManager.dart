import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:my_mailclient/model/contact.dart';
import 'package:my_mailclient/service/conctac_service.dart';

class ContactManager {
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final BehaviorSubject<int> _countSubject = BehaviorSubject<int>();
  final PublishSubject<List<Contact>> _collectionSubject = PublishSubject();

  Stream<int> get count$ => _countSubject.stream;

  Sink<String> get inFilter => _filterSubject.sink;

  Stream<List<Contact>> get browse$ => _collectionSubject.stream;

  ContactManager() {
    _filterSubject.stream.listen((filter) async {
      var contacts = await ContactService.browse(query: filter);
      _collectionSubject.add(contacts);
    });
    _collectionSubject.listen((list) => _countSubject.add(list.length));
  }

  void dispose() {
    _countSubject.close();
    _filterSubject.close();
  }
}
