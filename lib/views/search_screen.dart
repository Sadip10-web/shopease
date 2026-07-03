// search screen

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/controller/filter_controller.dart';
import 'package:shopease/views/homescreen.dart';
import 'package:shopease/widgets/filter_button.dart';
import 'package:shopease/widgets/product_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "productName": "Electronics",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
        "currentPrice": "Rs. 10000",
        "oldPrice": "Rs. 12000",
      },
      {
        "productName": "Electronics",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
        "currentPrice": "Rs. 10000",
        "oldPrice": "Rs. 12000",
      },
      {
        "productName": "Electronics",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
        "currentPrice": "Rs. 10000",
        "oldPrice": "Rs. 12000",
      },
      {
        "productName": "Electronics",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
        "currentPrice": "Rs. 10000",
        "oldPrice": "Rs. 12000",
      },
      {
        "productName": "Electronics",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
        "currentPrice": "Rs. 10000",
        "oldPrice": "Rs. 12000",
      },
      {
        "productName": "Electronics",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
        "currentPrice": "Rs. 10000",
        "oldPrice": "Rs. 12000",
      },
      {
        "productName": "Electronics",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlnDGMoPVwxaNdwOHBekAEWpCR-T8eEPb7m9OxUV-xxg&s=10",
        "currentPrice": "Rs. 10000",
        "oldPrice": "Rs. 12000",
      },
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
    
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Search",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
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
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Search here",
    
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Color(0xFF7A5AF8)),
                  onPressed: () {
                    // Add your search logic here
                  },
                ),
    
                // suffixIcon: MenuAnchor(
                //   builder: (context, controller, child) {
                //     return IconButton(
                //       icon: const Icon(Icons.tune, color: Color(0xFF7A5AF8)),
                //       onPressed: () {
                //         if (controller.isOpen) {
                //           controller.close();
                //         } else {
                //           controller.open();
                //         }
                //       },
                //     );
                //   },
                //   menuChildren: [
                //     MenuItemButton(
                //       onPressed: () {
                //         print("Price selected");
                //       },
                //       child: const Text("Price"),
                //     ),
                //     MenuItemButton(
                //       onPressed: () {
                //         print("Category selected");
                //       },
                //       child: const Text("Category"),
                //     ),
                //     MenuItemButton(
                //       onPressed: () {
                //         print("Rating selected");
                //       },
                //       child: const Text("Rating"),
                //     ),
                //     MenuItemButton(
                //       onPressed: () {
                //         print("Reset filters");
                //       },
                //       child: const Text("Reset Filters"),
                //     ),
                //   ],
                // ),
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
            SizedBox(height: 20),
            Center(
              child: Text(
                "Can't find what you are looking for?",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
            Center(
              child: Text(
                "Try different keywords or remove some filters",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
    
            Container(
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFF2EEF8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Filters",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
    
                      InkWell(
                        onTap: () {
                          Get.find<FilterController>().clearAllFilters();
                        },
                        child: const Text(
                          "Clear All",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF7A5AF8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
    
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: filterButton(
                          icon: Icons.local_offer_outlined,
                          title: "Category",
                          options: const [
                            "Electronics",
                            "Fashion",
                            "Furniture",
                            "Groceries",
                          ],
                        ),
                      ),
    
                      const SizedBox(width: 5),
    
                      Expanded(
                        child: filterButton(
                          icon: Icons.shopping_bag,
                          title: "Brand",
                          options: const [
                            "Apple",
                            "Samsung",
                            "Nike",
                            "Adidas",
                          ],
                        ),
                      ),
    
                      const SizedBox(width: 5),
    
                      Expanded(
                        child: filterButton(
                          icon: Icons.attach_money,
                          title: "Price",
                          options: const [
                            "Under Rs.500",
                            "Rs.500 - 1000",
                            "Rs.1000 - 5000",
                            "Above Rs.5000",
                          ],
                        ),
                      ),
    
                      const SizedBox(width: 5),
    
                      Expanded(
                        child: filterButton(
                          icon: Icons.star,
                          title: "Rating",
                          options: const ["5 ★", "4 ★ & Up", "3 ★ & Up"],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    
            SizedBox(height: 20),
    
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 cards per row
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  productTitle: categories[index]["productName"] as String,
                  imageUrl: categories[index]["image"] as String,
                  newPrice: categories[index]["currentPrice"] as String,
                  oldPrice: categories[index]["oldPrice"] as String,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
