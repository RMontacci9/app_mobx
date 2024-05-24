import 'package:app_mobx/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Tutorial',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        focusColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.deepPurpleAccent,
      ),
      home: LoginScreen(),
    );
  }
}
