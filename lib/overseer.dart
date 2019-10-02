
import 'package:my_mailclient/manager/ContactManager.dart';
import 'package:my_mailclient/manager/counter_manager.dart';
import 'package:my_mailclient/manager/message_form_manager.dart';

class Overseer{
  Map<dynamic, dynamic> repository = {};

  Overseer(){
    register(ContactManager, ContactManager());
    register(CounterManager, CounterManager());
    register(MessageFormManager, MessageFormManager());
  }

  register(name, object){
    repository[name] = object;
  }

  fetch(name){
    return repository[name];
  }

}