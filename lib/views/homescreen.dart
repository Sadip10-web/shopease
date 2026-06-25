// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopease/widgets/fillUp_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopease/widgets/tags_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Welcome to ", style: TextStyle(fontSize: 17)),
                    Text(
                      "ShopEase !",
                      style: GoogleFonts.itim(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,

                        color: Color(0xFF6D28FF),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Hello, ", style: TextStyle(fontSize: 17)),
                    Text(
                      "Mahesh. ",
                      style: GoogleFonts.itim(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,

                        color: Color(0xFF6D28FF),
                      ),
                    ),
                    Text("Greetings !!", style: TextStyle(fontSize: 17)),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        size: 30,
                        Theme.of(context).brightness == Brightness.light
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                      onPressed: () {
                        // Toggle theme here
                      },
                    ),
                  ],
                ),
                Gap(10),
                // search area
                FillupWidget(
                  hintText: "Search Here",
                  icon: Icons.search,

                  keyboardType: TextInputType.text,
                ),
                Gap(10),

                // tags area
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    child: Row(
                      children: [
                        TagsWidget(label: "All", icon: Icons.travel_explore),
                        Gap(5),
                        TagsWidget(label: "Fashion", icon: Icons.checkroom),
                        Gap(5),
                        TagsWidget(label: "Wearables", icon: Icons.watch),
                        Gap(5),
                        TagsWidget(label: "Shoes", icon: Icons.directions_run),
                        Gap(5),
                        TagsWidget(label: "Smartphone", icon: Icons.smartphone),
                        Gap(5),
                        TagsWidget(label: "Smartphone", icon: Icons.smartphone),
                        Gap(5),
                      ],
                    ),
                  ),
                ),
              ], //children
            ),
          ),
        ),
      ),
    );
  }
}
