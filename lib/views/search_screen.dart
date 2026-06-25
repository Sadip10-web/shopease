import 'package:flutter/material.dart';
import 'package:shopease/widgets/filter_button.dart';
import 'package:shopease/widgets/tags_widget.dart';
import 'package:shopease/widgets/wishlist_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

              // WishlistCard(
              //   imageUrl:
              //       "https://www.bing.com/th/id/OIP.P3Y-J0w1E9u1aFk-Ok-LxgHaHb?w=193&h=194&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
              //   productName: "Nike Sneakers",
              //   currentPrice: "Rs. 12,000",
              //   oldPrice: "Rs. 10,000",
              //   isFavorite: false,
              //   onFavoriteTap: ,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
