import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/views/homescreen.dart';
import 'package:shopease/views/login_view.dart';
import 'package:shopease/views/search_screen.dart';
import 'package:shopease/views/wishlist_view.dart';
// import 'package:shopease/views/order_history_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: HomeScreen(),
      // If you are currently developing SearchScreen,
      // temporarily change this to:
      // home: SearchScreen(),
    );
  }
}
