import 'package:flutter/material.dart';

class Helper {
  static void changeRoute({BuildContext context, dynamic navigateTo}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => navigateTo,
      ),
    );
  }
}
