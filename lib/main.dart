import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:shopease/views/homescreen.dart';
import 'package:shopease/views/order_history_view.dart';
=======
import 'package:shopease/views/Splashscreen.dart';
import 'package:shopease/views/edit_profile_screen.dart';
>>>>>>> f9a1a902abc1628e036a43175753772359464c82

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
<<<<<<< HEAD
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.white),
      ),
      
      home: OrderHistoryView(),
=======
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.white)),
      home: EditProfileScreen(),
>>>>>>> f9a1a902abc1628e036a43175753772359464c82
    );
  }
}
