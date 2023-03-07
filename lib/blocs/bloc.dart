import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:login_bloc/blocs/validators.dart';

class Bloc with Validators {
  // final _emailController = StreamController<String>.broadcast();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Add data to stream
  Stream<String> get email => _emailController.stream
      .transform(validateRequiredField)
      .transform(validateEmail);
  Stream<String> get password => _passwordController.stream
      .transform(validateRequiredField)
      .transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  // Retrieve data from stream
  String get emailValue =>
      _emailController.hasValue ? _emailController.value : '';
  String get passwordValue =>
      _passwordController.hasValue ? _passwordController.value : '';

  // Change data
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  submit() {
    print(
        'Email: ${_emailController.value} | Password: ${_passwordController.value}');
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

// Single Global instance of the Bloc
// Possibly OK for small apps
// final bloc = Bloc();
