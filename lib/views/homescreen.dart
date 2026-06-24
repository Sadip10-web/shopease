import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(


        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  Text("Hello, "),
                  Text(
                    "Mahesh!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6D28FF),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text("Welcome to "),
                  Text(
                    "ShopEase",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6D28FF),
                    ),  
                  )
                ],
              ),
              Spacer(),
            ], //children
          ),
        ),
      ),
    );
  }
}