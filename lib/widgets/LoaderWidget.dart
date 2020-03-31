import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Theme.of(context).primaryColorDark,
          size: 50.0,
        ),
      ),
    );
  }
}
