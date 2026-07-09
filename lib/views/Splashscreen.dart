import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shopease/views/AfterSplashScreen.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void authcheck(){
    Future.delayed(Duration(seconds: 3),(){
      Get.off(()=>  Aftersplashscreen(),
      transition: Transition.zoom
      );
    });
  }
  @override
  void initState() {
   
    super.initState();
    authcheck();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF6D28FF),
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
                Text("Shop Smarter,Live Better...",style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: 'Poppins' ),)
            ],
          ),
        ),
      ),
    );
  }
}