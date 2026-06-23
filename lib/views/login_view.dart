

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopease/widgets/Screentitle.dart';
import 'package:shopease/widgets/emailfield.dart';

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
              Screen_title(text: 'Login',),

              // Email
              emailfield(text: 'Email', hintText: 'Enter your email', icon: Icons.mail,),

              // password
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5B6475),
                ),
              ),
              Gap(12),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF6F3FF),
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  hint: Text(
                    "Enter your password",
                    style: TextStyle(color: Color(0xFF5B6475), fontSize: 15),
                  ),

                  prefixIcon: Icon(Icons.lock, color: Color(0xFF6D28FF)),

                  suffixIcon: Icon(
                    Icons.visibility_off,
                    size: 20,
                    fontWeight: FontWeight.bold,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide(color: Color(0xffE5E7EB)),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide(color: Color(0xffE5E7EB)),
                  ),
                ),
                obscureText: true,
              ),

              Gap(10),

              // forget text
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    onPressed: () {

                    },
                    child: Text(
                      "Forgot Password?",
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
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Color(0xFF6D28FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(15),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {

                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
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
                    style: TextStyle(
                      fontSize: 15, 
                      color: Colors.black
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(
                        color: Color(0xFF6D28FF),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
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

