// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C3EF4), // Same blue as your heading
        foregroundColor: Colors.white, // Back button & title color
        title: Text("privacy".tr),
        centerTitle: false,
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth;

            if (constraints.maxWidth >= 1200) {
              maxWidth = 900;
            } else if (constraints.maxWidth >= 800) {
              maxWidth = 750;
            } else {
              maxWidth = constraints.maxWidth;
            }

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 24,
                  ),
                  child: SelectableText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${"privacy".tr}\n\n",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,

                            color: const Color.from(
                              alpha: 0,
                              red: 0,
                              green: 0,
                              blue: 0,
                            ),
                          ),
                        ),

                        TextSpan(
                          text: "privacy_content".tr,
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            height: 1.7, // ✅ Correct
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
