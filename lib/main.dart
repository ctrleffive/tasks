import 'package:flutter/material.dart';
import 'package:tasks/ui/Intro.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple.shade600
      ),
      home: Intro(),
    );
  }
}