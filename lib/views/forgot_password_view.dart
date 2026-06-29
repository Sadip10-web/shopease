import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/views/Verifyotp.dart';
import 'package:shopease/widgets/Screentitle.dart';
import 'package:shopease/widgets/button_widget.dart';
import 'package:shopease/widgets/emailfield.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            ScreenTitle(text: "FORGOT PASSWORD"),
            EmailField(text: "Email", hintText: "Enter your email", icon: Icons.mail),
            ButtonWidget(buttonText: "Next", backgroundColor: Color(0xFF6D28FF), onPressed: () {Get.to(()=>Verifyotp()); }, color: Colors.white,)
          ],
        ),
      ) ,
    );
  }
}