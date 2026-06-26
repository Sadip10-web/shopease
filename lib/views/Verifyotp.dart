import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shopease/views/changepassword_screen.dart';
import 'package:shopease/widgets/Screentitle.dart';
import 'package:shopease/widgets/button_widget.dart';
import 'package:shopease/widgets/otpfield.dart';

class Verifyotp extends StatelessWidget {
  const Verifyotp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            ScreenTitle(text: "VERIFY OTP"),
            Text("We have sent a verification code at example@gmail.com",
            textAlign: TextAlign.center,),
           Gap(10),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpField(),
              OtpField(),
              OtpField(),
              OtpField()
            ],
           ),
           Gap(20),
           
           ButtonWidget(buttonText: "Verify", backgroundColor:  Color(0xFF6D28FF), onPressed: () {Get.off(()=>ChangepasswordScreen());  }, color: Colors.white,)

          ],
          
          
        ),
      )
    );
  }
}


 