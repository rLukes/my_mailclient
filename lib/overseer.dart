
import 'package:my_mailclient/ContactManager.dart';
import 'package:my_mailclient/counter_manager.dart';

class Overseer{
  Map<dynamic, dynamic> repository = {};

  Overseer(){
    register(ContactManager, ContactManager());
    register(CounterManager, CounterManager());
  }

  register(name, object){
    repository[name] = object;
  }

  fetch(name){
    return repository[name];
  }

}