import 'package:brew_crew/mixins/ValidatorMixin.dart';
import 'package:brew_crew/models/User.dart';
import 'package:brew_crew/screens/authentiation/Signup.dart';
import 'package:brew_crew/services/AuthService.dart';
import 'package:brew_crew/widgets/LoaderWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/Helper.dart';

class Signin extends StatefulWidget {
  Signin({Key key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _auth = new AuthService();
  final _formKey = new GlobalKey<FormState>();
  final _validatorMixin = new ValidatorMixin();
  bool loading = false;

  Map<String, String> credential = {
    "email": null,
    "password": null,
  };

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoaderWidget()
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text("Sign In"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Helper.changeRoute(context: context, navigateTo: Signup());
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _emailTextField(),
                    _passwordTextField(),
                    new Container(height: 15),
                    _submitButton(context),
                  ],
                ),
              ),
            ),
          );
  }

  Widget _emailTextField() {
    return TextFormField(
      autocorrect: false,
      decoration: InputDecoration(labelText: "Email address"),
      validator: _validatorMixin.emailValidator,
      onSaved: (String input) {
        credential['email'] = input;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      autocorrect: false,
      obscureText: true,
      validator: _validatorMixin.passwordValidator,
      decoration: InputDecoration(labelText: "Password"),
      onSaved: (String input) {
        credential['password'] = input;
      },
    );
  }

  Widget _submitButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          RaisedButton.icon(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print(credential.toString());
              }
            },
            icon: Icon(Icons.lock_open),
            label: Text("Sign in"),
            color: Theme.of(context).primaryColorDark,
            textColor: Colors.white,
          ),
          SizedBox(width: 15),
          RaisedButton.icon(
            onPressed: () async {
              setState(() => loading = true);
              await _auth.signInAnnonymously();
              setState(() => loading = false);
            },
            icon: Icon(Icons.lock_open),
            label: Text("Sign in annonymously"),
            color: Colors.pinkAccent[400],
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
