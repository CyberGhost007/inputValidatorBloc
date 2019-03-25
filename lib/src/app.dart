import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/loginScreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log me in BLoC',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}