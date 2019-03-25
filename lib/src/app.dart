import 'package:flutter/material.dart';
import 'package:login_bloc/src/screens/loginScreen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Log me in BLoC',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
