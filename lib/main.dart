import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Employee App',
      theme: ThemeData(
        primaryColor: Colors.deepOrange
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}