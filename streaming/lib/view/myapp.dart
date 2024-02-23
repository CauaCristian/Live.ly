import 'package:flutter/material.dart';
import 'loginPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(255, 2, 0, 22),
      ),
      home: LoginPage(),
    );
  }
}
