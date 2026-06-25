import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopease/widgets/button_widget.dart';
import 'package:shopease/widgets/emailfield.dart';
import 'package:shopease/widgets/fillUp_widget.dart';
import 'package:shopease/widgets/title_widget.dart';

// register Screen

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(35),

                // back icon
                Icon(Icons.arrow_back, size: 28, color: Colors.black),

                Gap(35),

                // Register text
                Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
                Gap(42),

                // Name
                TitleWidget(title: "Name"),
                Gap(12),
                FillupWidget(
                  placeHolder: "Enter your name",
                  icon: Icons.person,
                  keyboardType: TextInputType.text,
                ),

                Gap(30),

                // Email
                EmailField(
                  text: "Email", 
                  hintText: "Enter your email", 
                  icon: Icons.email
                ),

                // password
                TitleWidget(title: "Password"),
                Gap(12),
                FillupWidget(
                  placeHolder: "Enter your password",
                  icon: Icons.lock,
                  keyboardType: TextInputType.text,
                ),

                Gap(30),

                // confirm password
                TitleWidget(title: "Confirm Password"),
                Gap(12),
                FillupWidget(
                  placeHolder: "Confirm your password",
                  icon: Icons.lock,
                  keyboardType: TextInputType.text,
                ),

                Gap(28),

                // create account button
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ButtonWidget(
                          buttonText: "Create Account",
                          backgroundColor: Color(0xFF6D28FF), onPressed: () { 

                           },
                        ),
                      ),
                    ),


                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
