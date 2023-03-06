import 'dart:async';
import 'package:login_bloc/utils/email_validator.dart';

class Validators {
  final validateRequiredField = StreamTransformer<String, String>.fromHandlers(
    handleData: (String value, EventSink<String> sink) {
      if (value.isEmpty) {
        sink.addError('Required');
      } else {
        sink.add(value);
      }
    },
  );

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (String email, EventSink<String> sink) {
      if (email.isValidEmail()) {
        sink.add(email);
      } else {
        sink.addError('Enter a valid email');
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (String password, EventSink<String> sink) {
      if (password.length > 3) {
        sink.add(password);
      } else {
        sink.addError('Password must be at least 4 characters');
      }
    },
  );
}
