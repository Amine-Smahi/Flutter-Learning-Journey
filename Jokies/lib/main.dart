import 'package:flutter/material.dart';
import 'mainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokies',
      theme: new ThemeData(
          primaryColor: Color(0xFF816BFA),
          iconTheme: new IconThemeData(color: Colors.black),
          accentColor: Color(0xFF816BFA),
          brightness: Brightness.dark),
      home: MainPage(title: 'Jokies'),
    );
  }
}