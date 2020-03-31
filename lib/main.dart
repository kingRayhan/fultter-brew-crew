import 'package:brew_crew/models/User.dart';
import 'package:brew_crew/screens/root.dart';
import 'package:brew_crew/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.brown[400]),
          scaffoldBackgroundColor: Colors.brown[100],
          primaryColorDark: Colors.brown[400],
        ),
        debugShowCheckedModeBanner: false,
        title: 'Brew crew App',
        home: new RootScreen(),
      ),
    );
  }
}
