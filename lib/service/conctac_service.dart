import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_mailclient/model/contact.dart';

class ContactService{
  static String _url = "https://jsonplaceholder.typicode.com/users";

  static Future browse() async{
    http.Response response = await http.get(_url);

    await Future.delayed(Duration(seconds: 1));

    String content = response.body;
    List collection = json.decode(content);
    List<Contact> contacts = collection.map((c) => new Contact.fromJson(c)).toList();
    return contacts;
  }

}