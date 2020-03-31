import 'package:brew_crew/models/User.dart';
import 'package:brew_crew/services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  Signin({Key key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Sign In"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  User user = await _auth.signInAnnonymously();
                  print(user);
                },
                child: Text("Signin With Annonymously"),
              ),
              RaisedButton(
                onPressed: () async {
                  _auth.logout();
                },
                child: Text("Logout"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
