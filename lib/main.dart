import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/views/Splashscreen.dart';
import 'package:shopease/views/category_view.dart';
import 'package:shopease/views/homescreen.dart';
import 'package:shopease/views/order_history_view.dart';
import 'package:shopease/views/order_success.dart';
import 'package:shopease/views/product_detail.dart';

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
      home: OrderHistoryView(),
    );
  }
}
