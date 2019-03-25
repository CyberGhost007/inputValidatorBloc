import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  // We are going to use BehaviorSubject(basically upgraded version of StreamController) by defailt
  // BehaviorSubject is, by default, a broadcast (aka hot) controller

  // OLD CODE
  // final StreamController _emailController = StreamController<String>.broadcast();
  // final StreamController _passwordController = StreamController<String>.broadcast();

  // NEW CODE
  final BehaviorSubject _emailController = BehaviorSubject<String>();
  final BehaviorSubject _passwordController = BehaviorSubject<String>();

  // Getter{get} allows you to expose some parts of your class

  // Retrieve data from stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);

  // Combining both Streams if no error it will return both the values from given streams
  Stream<Map> get submitValid => Observable.combineLatest2(
        email,
        password,
        (e, p) => {'email': e, 'password': p},
      );

  // Add data to stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Onpressed callback
  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print('Email: $validEmail | Password: $validPassword');
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

// final bloc = Bloc();
