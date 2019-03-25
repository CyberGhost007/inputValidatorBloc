import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          SizedBox(height: 16.0),
          button(),
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data != null) {
          print(snapshot.data);
        }
        return TextField(
          focusNode: _emailNode,
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Your email',
            hintText: 'name@example.com',
            errorText: snapshot.error,
          ),
          textInputAction: TextInputAction.next,
          onSubmitted: (term) {
            _emailNode.unfocus();
            FocusScope.of(context).requestFocus(_passwordNode);
          },
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
      stream: bloc.password,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data != null) {
          print(snapshot.data);
        }
        return TextField(
          focusNode: _passwordNode,
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Your password',
            errorText: snapshot.error,
          ),
          textInputAction: TextInputAction.done,
        );
      },
    );
  }

  Widget button() {
    return RaisedButton(
      onPressed: () {},
      child: Text('Login'),
      color: Colors.deepOrangeAccent[400],
      textColor: Colors.white,
    );
  }
}
