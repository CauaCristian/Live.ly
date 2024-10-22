import 'package:flutter/material.dart';
import 'package:streaming/screens/login_Page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(255, 2, 0, 22),
      ),
      home: LoginPage(),
    );
  }
}
