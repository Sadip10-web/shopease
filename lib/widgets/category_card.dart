import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  String image;
  String title;

  CategoryCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(image, width: 120, height: 100)),

            SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(title),
                    SizedBox(height: 10),
                    Text("125 products"),
                  ],
                ),

                SizedBox(width: 40),

                Icon(Icons.arrow_forward),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
