import 'package:flutter/material.dart';
import 'package:shopease/widgets/Screentitle.dart';
import 'package:shopease/widgets/button_widget.dart';
import 'package:shopease/widgets/passwordfield_widget.dart';

class ChangepasswordScreen extends StatelessWidget {
  const ChangepasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
        ScreenTitle(text: "CHANGE PASSWORD"),
         PasswordFieldWidget(text: 'New Password', hintText: 'Enter new Password',),
         PasswordFieldWidget(text: "Confirm Password ", hintText: "Re-enter new Password"),
         ButtonWidget(buttonText: "Proceed", backgroundColor:  Color(0xFF6D28FF), onPressed: (){}, color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
