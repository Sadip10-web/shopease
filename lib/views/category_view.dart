// categoryScreen

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/views/homescreen.dart';
import 'package:shopease/views/search_screen.dart';
import 'package:shopease/widgets/category_card.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Get.off(() => HomeScreen());
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            /// Search Bar
            TextField(
              readOnly: true,
              onTap: () {
                Get.to(() => SearchScreen());
              },
              decoration: InputDecoration(
                hintText: "Search here",

                prefixIcon: const Icon(Icons.search, color: Colors.grey),

                filled: true,
                fillColor: Colors.white,

                contentPadding: const EdgeInsets.symmetric(vertical: 14),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Color(0xFF7A5AF8)),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Color(0xFF7A5AF8)),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color(0xFF7A5AF8),
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "All Categories",
              style: TextStyle(
                color: Color.fromARGB(255, 105, 105, 105),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              itemCount: 5,

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.95,
              ),

              itemBuilder: (context, index) {
                final categories = [
                  {
                    "title": "Electronics",
                    "image": "assets/images/electronics.png",
                    "color": Color(0xFFEAF4FF),
                  },
                  {
                    "title": "Fashion",
                    "image": "assets/images/fashion.png",
                    "color": Color(0xFFF1F8F0),
                  },
                  {
                    "title": "Grocery",
                    "image": "assets/images/grocery.png",
                    "color": Color(0xFFEFF7F0),
                  },
                  {
                    "title": "Sports",
                    "image": "assets/images/sports.png",
                    "color": Color(0xFFFFF6E7),
                  },
                  {
                    "title": "Beauty",
                    "image": "assets/images/beauty.png",
                    "color": Color(0xFFF8EFFA),
                  },
                ];

                return CategoryCard(
                  title: categories[index]["title"] as String,
                  image: categories[index]["image"] as String,
                  backgroundColor: categories[index]["color"] as Color,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
