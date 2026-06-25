import 'package:flutter/material.dart';
import 'package:shopease/views/cartScrenn_view.dart';
import 'package:shopease/views/login_view.dart';
import 'package:shopease/views/payment_screen.dart';

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
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.white)),
      home: Cartscreenview(),
    );
  }
}
