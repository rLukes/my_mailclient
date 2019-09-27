import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_mailclient/model/contact.dart';

class ContactService {
  static String _url = "https://jsonplaceholder.typicode.com/users";

  static Future<List<Contact>> browse({query}) async {
    http.Response response = await http.get(_url);
    await Future.delayed(Duration(seconds: 1));

    String content = response.body;
    List collection = json.decode(content);

    Iterable<Contact> _contacts =
        collection.map((c) => new Contact.fromJson(c));
    if (query != null && query.isNotEmpty) {
      _contacts = _contacts.where((c) => c.name.toLowerCase().contains(query));
    }
    return _contacts.toList();
  }
}
