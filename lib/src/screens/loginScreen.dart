import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/provider.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          SizedBox(height: 16.0),
          button(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
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

  Widget passwordField(Bloc bloc) {
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

  Widget button(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          onPressed: !snapshot.hasData ? null : bloc.submit,
          child: Text('Login'),
          color: Colors.deepOrangeAccent[400],
          textColor: Colors.white,
        );
      },
    );
  }
}
