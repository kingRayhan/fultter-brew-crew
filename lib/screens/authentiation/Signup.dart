import 'package:brew_crew/mixins/ValidatorMixin.dart';
import 'package:brew_crew/models/User.dart';
import 'package:brew_crew/Helper.dart';
import 'package:brew_crew/screens/authentiation/Signin.dart';
import 'package:brew_crew/services/AuthService.dart';
import 'package:brew_crew/widgets/LoaderWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
              title: Text("Sign up"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Helper.changeRoute(context: context, navigateTo: Signin());
                  },
                  child: Text(
                    "Sign in",
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
      child: RaisedButton.icon(
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            setState(() => loading = true);
            _formKey.currentState.save();

            User user = await _auth.register(
              credential['email'],
              credential['password'],
            );

            if (user == null) {
              setState(() => loading = false);
              print("invalid");
            } else {
              setState(() => loading = false);
            }
          }
        },
        icon: Icon(Icons.lock_open),
        label: Text("Sign up"),
        color: Theme.of(context).primaryColorDark,
        textColor: Colors.white,
      ),
    );
  }
}
