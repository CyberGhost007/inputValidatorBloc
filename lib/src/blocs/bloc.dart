import 'dart:async';
import 'validators.dart';

class Bloc with Validators {
  final StreamController _emailController = StreamController<String>();
  final StreamController _passwordController = StreamController<String>();

  // Getter{get} allows you to export some part of your class
  // Retrieve data from stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);

  // Add data to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = Bloc();
