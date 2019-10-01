
import 'package:my_mailclient/ContactManager.dart';

class Overseer{
  Map<dynamic, dynamic> repository = {};

  Overseer(){
    register(ContactManager, ContactManager());
  }

  register(name, object){
    repository[name] = object;
  }

  fetch(name){
    return repository[name];
  }

}