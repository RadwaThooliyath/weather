import 'package:flutter/material.dart';
import 'package:weather/screens/homePage.dart';
import 'package:weather/screens/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),debugShowCheckedModeBanner: false,
    );
  }
}
