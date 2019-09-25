// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return new Message(json['subject'] as String, json['body'] as String);
}

abstract class _$MessageSerializerMixin {
  String get subject;
  String get body;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'subject': subject, 'body': body};
}
