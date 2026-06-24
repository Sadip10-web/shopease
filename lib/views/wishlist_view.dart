import 'package:flutter/material.dart';

class Wishlistview extends StatefulWidget {
  const Wishlistview({super.key});

  @override
  State<Wishlistview> createState() => _WishlistviewState();
}

class _WishlistviewState extends State<Wishlistview> {
  final List<String> categories = [
    "All",
    "Shoes",
    "Electronics",
    "Fashion",
    "Sports",
    "Accessories",
    "Home",
    "Beauty",
  ];

  int selectedCategory = 0;
  final List<Map<String, dynamic>> wishlist = [
    {
      "image":
          "https://www.bing.com/th/id/OIP.P3Y-J0w1E9u1aFk-Ok-LxgHaHb?w=193&h=194&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
      "name": "Nike Sneakers",
      "price": "Rs. 10,000",
      "oldPrice": "Rs. 12,000",
      "isFavorite": true,
    },
    {
      "image":
          "https://www.bing.com/th/id/OIP.Sjb_xI-Mh0fAgfu7zuD_eQHaHa?w=193&h=193&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
      "name": "Washing Machine",
      "price": "Rs. 8,500",
      "oldPrice": "Rs. 9,999",
      "isFavorite": true,
    },
    {
      "image":
          "https://www.bing.com/th/id/OIP.EZwrgPYPlEvi4LmWsiMdGgHaHa?w=193&h=193&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
      "name": "A Grade Jersey",
      "price": "Rs. 7,200",
      "oldPrice": "Rs. 8,000",
      "isFavorite": true,
    },
    {
      "image":
          "https://th.bing.com/th/id/OIP.-mlXrJBHBDf1TqFWd99xDQHaHb?w=141&h=150&c=6&o=7&dpr=1.3&pid=1.7&rm=3",
      "name": "Water bottle",
      "price": "Rs. 9,300",
      "oldPrice": "Rs. 10,500",
      "isFavorite": true,
    },
    {
      "image":
          "https://www.bing.com/th/id/OIP.18tc32s6GkPnZv3ENmHEfAHaHa?w=193&h=193&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
      "name": "Smart Watch",
      "price": "Rs. 7,800",
      "oldPrice": "Rs. 9,200",
      "isFavorite": true,
    },
    {
      "image":
          "https://www.bing.com/th/id/OIP.3trQnx1qoS6Rdm9jAJRacQHaId?w=193&h=221&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
      "name": "Wireless Headphones",
      "price": "Rs. 5,499",
      "oldPrice": "Rs. 6,499",
      "isFavorite": true,
    },
    {
      "image":
          "https://www.bing.com/th/id/OIP.sMAKo4GpcazOqITP2h6VcAHaIo?w=193&h=225&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
      "name": "Backpack",
      "price": "Rs. 2,199",
      "oldPrice": "Rs. 2,999",
      "isFavorite": true,
    },
    {
      "image":
          "https://www.bing.com/th/id/OIP.PhV5SpzcvUFjD5p9kcw_PQHaHa?w=193&h=193&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
      "name": "Running Shoes",
      "price": "Rs. 6,999",
      "oldPrice": "Rs. 8,499",
      "isFavorite": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "My Wishlist",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final bool isSelected = selectedCategory == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, top: 8, bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color.fromARGB(255, 0, 0, 0)
                          : const Color.fromARGB(255, 242, 237, 237),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: wishlist.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.70,
              ),
              itemBuilder: (context, index) {
                return WishlistCard(
                  imageUrl: wishlist[index]["image"],
                  productName: wishlist[index]["name"],
                  currentPrice: wishlist[index]["price"],
                  oldPrice: wishlist[index]["oldPrice"],
                  isFavorite: wishlist[index]["isFavorite"],
                  onFavoriteTap: () {
                    setState(() {
                      wishlist[index]["isFavorite"] =
                          !wishlist[index]["isFavorite"];

                      if (!wishlist[index]["isFavorite"]) {
                        wishlist.removeAt(index);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WishlistCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String currentPrice;
  final String oldPrice;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const WishlistCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.currentPrice,
    required this.oldPrice,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(child: Image.network(imageUrl, fit: BoxFit.contain)),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: Text(
                  productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              InkWell(
                onTap: onFavoriteTap,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Text(
            currentPrice,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            oldPrice,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
