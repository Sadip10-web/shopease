import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shopease/views/register_view.dart';
import 'package:shopease/widgets/button_widget.dart';
import 'package:shopease/widgets/fillUp_widget.dart';
import 'package:shopease/widgets/title_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(35),

              // back icon
              Icon(Icons.arrow_back, size: 28, color: Colors.black),

              Gap(35),

              // Login text
              Center(
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
              ),

              Gap(42),

              // Email
              TitleWidget(title: "Email"),
              Gap(12),
              FillupWidget(
                placeHolder: "Enter your email",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),

              Gap(30),

              // password
              TitleWidget(title: "Password"),
              Gap(12),
              FillupWidget(
                placeHolder: "Enter your password",
                icon: Icons.lock,
                keyboardType: TextInputType.text,
              ),
              Gap(10),

              // forget text
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Color(0xFF6D28FF),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),

              Gap(28),

              // login button
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ButtonWidget(
                        buttonText: "Login",
                        backgroundColor: Color(0xFF6D28FF),
                      ),
                    ),
                  ),
                ],
              ),

              Gap(25),

              // sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => RegisterView());
                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(
                        color: Color(0xFF6D28FF),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
