import 'package:brew_crew/services/AuthService.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brew crew"),
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              _auth.logout();
            },
            icon: Icon(Icons.person, color: Colors.white),
            label: Text("Logout", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
