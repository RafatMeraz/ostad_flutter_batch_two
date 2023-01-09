import 'package:flutter/material.dart';

/// projects' entry point
/// SKIA / Impeller
///
/// Hot restart (ctl + \) (cmd + shift + \)
/// Hot reload (ctl + s) (cmd + s)
main() {
  print('Entry point');
  runApp(HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// property/attributes
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 8,
          title: Text('Hello'),
        ),
        body: Text('Hello'),
      ),
    );
  }
}
