import 'dart:async';

mixin Validation {
  static bool isEmail(String email) => email.contains("@");

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEmail(value)) {
      sink.add(value);
    } else {
      sink.addError("This field is invalid");
    }
  });
}
