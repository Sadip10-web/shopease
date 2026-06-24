import 'package:flutter/material.dart';
import 'package:shopease/widgets/category_card.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories'), leading: BackButton()),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              // child: Container(
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Here",
                  prefixIcon: Icon(Icons.search),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFF6D28FF)),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFF6D28FF), width: 2),
                  ),
                ),
              ),
            ),

            //),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("All Categories"),
            ),

            SizedBox(height: 10),

            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: [
                CategoryCard(
                  image: "assets/images/electronics.png",
                  title: "Electronics",
                ),
                CategoryCard(
                  image: "assets/images/sports.png",
                  title: "Sports",
                ),
                CategoryCard(
                  image: "assets/images/fashion.png",
                  title: "Fashion",
                ),
                CategoryCard(
                  image: "assets/images/beauty.png",
                  title: "Beauty",
                ),
                CategoryCard(
                  image: "assets/images/grocery.png",
                  title: "Groceries",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
