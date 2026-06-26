import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/views/login_view.dart';
import 'package:shopease/widgets/Screentitle.dart';
import 'package:shopease/widgets/button_widget.dart';
import 'package:shopease/widgets/emailfield.dart';
import 'package:shopease/widgets/passwordfield_widget.dart';

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

                // back icon and title
                ScreenTitle(
                  text: "Register"
                ),
                

                // Name
                EmailField(
                  text: "Name", 
                  hintText: "Enter your name", 
                  icon: Icons.person
                ),


                // Email
                EmailField(
                  text: "Email",
                  hintText: "Enter your email",
                  icon: Icons.email,
                ),



                // password
                PasswordFieldWidget(
                  text: "Password", 
                  hintText: "Enter your password"
                ),


                // confirm password
                PasswordFieldWidget(
                  text: "Confirm Password", 
                  hintText: "Confirm your password"
                ),


                // create account button
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ButtonWidget(
                          buttonText: "Create Account",
                          backgroundColor: Color(0xFF6D28FF), 
                          onPressed: () { 
                            Get.to(() => LoginView());
                           }, color: Colors.white,
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
