import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'Message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse({String status = 'important'}) async {
    //String content = await rootBundle.loadString('data/message.json');
    String url = status == 'important' ? 'http://www.mocky.io/v2/5d8dd43e31000006632b50d0' : 'http://www.mocky.io/v2/5d8b6d1c3500005c00d46fd4';
    http.Response response = await http.get(url);

    await Future.delayed(Duration(seconds: 1));

    String content = response.body;

    List collection = json.decode(content);

    List<Message> _messages =
        collection.map((m) => new Message.fromJson(m)).toList();
    return _messages;
  }
}
