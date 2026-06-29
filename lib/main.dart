import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/views/Splashscreen.dart';
import 'package:shopease/views/cartScrenn_view.dart';
import 'package:shopease/views/category_view.dart';
import 'package:shopease/views/changepassword_screen.dart';
import 'package:shopease/views/edit_profile_screen.dart';
import 'package:shopease/views/Splashscreen.dart';
import 'package:shopease/views/homescreen.dart';
import 'package:shopease/views/order_history_view.dart';
import 'package:shopease/views/payment_screen.dart';
import 'package:shopease/views/product_detail.dart';
import 'package:shopease/views/search_screen.dart';
import 'package:shopease/views/Verifyotp.dart';
import 'package:shopease/views/edit_profile_screen.dart';
import 'package:shopease/views/forgot_password_view.dart';
import 'package:shopease/views/homescreen.dart';
import 'package:shopease/views/login_view.dart';
import 'package:shopease/views/order_history_view.dart';
import 'package:shopease/views/product_detail.dart';
import 'package:shopease/views/terms_condition.dart';
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
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),

      home: CategoryPage(),
      // home: CategoryPage(),
    );
  }
}
