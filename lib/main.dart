import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/views/Splashscreen.dart';
import 'package:shopease/views/Verifyotp.dart';
import 'package:shopease/views/edit_profile_screen.dart';
import 'package:shopease/views/forgot_password_view.dart';
import 'package:shopease/views/homescreen.dart';
import 'package:shopease/views/login_view.dart';
import 'package:shopease/views/order_history_view.dart';
import 'package:shopease/views/product_detail.dart';
import 'package:shopease/views/terms_condition.dart';
import 'package:shopease/views/wishlist_view.dart';

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
      home: LoginView(),
    );
  }
}