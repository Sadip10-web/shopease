import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:shopease/views/login_view.dart';
import 'package:shopease/widgets/Screentitle.dart';

import 'package:shopease/widgets/passwordfield_widget.dart';

class ChangepasswordScreen extends StatelessWidget {
  const ChangepasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
          ScreenTitle(text: "CHANGE PASSWORD"),
           PasswordFieldWidget(text: 'New Password', hintText: 'Enter new Password',),
           PasswordFieldWidget(text: "Confirm Password ", hintText: "Re-enter new Password"),
           Row(
        children: [
          Expanded(
            child: FilledButton.icon(
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor:  Color(0xFF6D28FF),
                side: BorderSide(color: Colors.grey.shade300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                ),
                elevation: 0,
                
              ),
              onPressed: (){
                Get.snackbar(
                  "Sucess",
                   "Password changed sucessfully",
                   duration: const Duration(seconds: 2)
                   );
                
                Future.delayed(Duration(seconds: 2),(){
                  Get.offAll(()=>LoginView());
                });
              },
              
              label: Text(
                "Change Password",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color:Colors.white,
                ),
              ),
            ),
          ),
        ],
            )
            ],
          ),
        ),
      ),
    );
  }
}
