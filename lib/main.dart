import 'package:flutter/material.dart';
import 'package:tasks/ui/Intro.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple.shade500,
        scaffoldBackgroundColor: Colors.deepPurple.shade500,
      ),
      home: Intro(),
    );
  }
}