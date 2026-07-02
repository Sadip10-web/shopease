// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
          0xFF6C3EF4,
        ), // Same color as Privacy Policy
        foregroundColor: Colors.white, // White title and back button
        title: Text("terms".tr),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Text(
          "terms_content".tr,
          style: const TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            height: 1.7,
          ),
        ),
      ),
    );
  }
}
