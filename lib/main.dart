import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/views/edit_profile_screen.dart';
import 'package:shopease/views/homescreen.dart';
import 'package:shopease/views/order_history_view.dart';
import 'package:shopease/views/product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.white),
      ),
      home: EditProfileScreen(),
    );
  }
}