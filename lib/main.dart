import 'package:flutter/material.dart';
import 'package:shopease/views/Verifyotp.dart';
import 'package:shopease/views/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.white),
      ),
      home: HomeScreen(),
    );
  }
}