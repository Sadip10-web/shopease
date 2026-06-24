import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
          Icon(Icons.arrow_back, size: 28, color: Colors.black),
          
          Gap(35),
          
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
          
          Gap(42),
        ],
      ),
    );
  }
}
