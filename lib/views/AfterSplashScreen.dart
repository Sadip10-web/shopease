import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:shopease/views/login_view.dart';
import 'package:shopease/views/register_view.dart';
import 'package:shopease/widgets/button_widget.dart';

class Aftersplashscreen extends StatelessWidget {
  const Aftersplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
        color: Color(0xFF6D28FF),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/shopeasebag.png",height: 60,width: 64,),
                Text("ShopEase",style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontFamily: 'Poppins'
                  ),
                  ),
                  Text("Shop Smarter,Live Better...",style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: 'Poppins'),),
                  Gap(15),
                  Image.asset("assets/images/Splashimage.png",height: 150,),
                  Gap(20),
                  ButtonWidget(buttonText: "Log In", backgroundColor: Color.fromARGB(255, 253, 252, 253), onPressed: (){Get.to(()=>LoginView());
                  }, color: Color(0xFF6D28FF),),
                  Gap(20),
                  ButtonWidget(buttonText: "Sign Up", backgroundColor: const Color.fromARGB(255, 254, 255, 253), onPressed: (){
                    Get.to(()=>RegisterView());
                  }, color: Color(0xFF6D28FF),),
              ],
            ),
          ),
        ),
      )
    );
  }
}        