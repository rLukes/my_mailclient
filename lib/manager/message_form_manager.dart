import 'dart:async';
import 'package:my_mailclient/model/validation.dart';
import 'package:rxdart/rxdart.dart';

class MessageFormManager with Validation{
  final _email = BehaviorSubject<String>();

  Stream<String> get email$ => _email.stream.transform(validateEmail);
  Sink<String> get inEmail => _email.sink;
}
