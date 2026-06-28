import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Search",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),

          leading: const BackButton(color: Colors.black),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search here",

                  prefixIcon: const Icon(Icons.search, color: Colors.grey),

                  suffixIcon: Icon(Icons.tune, color: Color(0xFF7A5AF8)),

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

                        Text(
                          "Clear All",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF7A5AF8),
                            fontWeight: FontWeight.bold,
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
                            title: 'Category',
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: filterButton(
                            icon: Icons.shield_outlined,
                            title: 'Brand',
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: filterButton(
                            icon: Icons.attach_money,
                            title: 'Price',
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
      ),
    );
  }
}
