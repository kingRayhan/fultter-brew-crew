import 'package:brew_crew/models/User.dart';
import 'package:brew_crew/screens/authentiation/authentication.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:brew_crew/services/AuthService.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return user != null ? HomeScreen() : Authentication();
  }
}
