import 'package:flutter/material.dart';
import 'package:watches_app/view/log/login.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watches App',
      home:  LoginPage(),
    );
  }
}