import 'package:flutter/material.dart';

import 'Calculator.dart';

void main() {
  runApp(MyApp()); //runApp(widget/className)
}

class MyApp extends StatelessWidget {
  //default flutter class name: MyApp otherwise error due to test/widget_test.dart
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // to remove banner on top-right
      //change Container to MaterialApp coz MaterialApp is a class which supports more widgets than container
      home: Calculator(),
    );
  }
}
