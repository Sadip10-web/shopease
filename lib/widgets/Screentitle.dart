import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class ScreenTitle extends StatelessWidget {
  final String text;
  
   const ScreenTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(35),
          
          // back icon
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back, 
              size: 28, 
              color: Colors.black
            ),
          ),
          
          Gap(25),
          
          // Login text
          Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
          
          Gap(40),
        ],
      ),
    );
  }
}