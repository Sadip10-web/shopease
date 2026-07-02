import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/views/product_detail.dart';

// Change the path if needed

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productTitle;
  final String oldPrice;
  final String newPrice;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.oldPrice,
    required this.newPrice,
    required this.productTitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Get.to(() => ProductDetail());
      },
      child: Card(
        elevation: 3,
        child: SizedBox(
          height: 305,
          width: 200,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        productTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO: Add favorite functionality
                      },
                      icon: const Icon(CupertinoIcons.heart, color: Colors.red),
                    ),
                  ],
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    newPrice,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 16, 187, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Price: ",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      oldPrice,
                      style: const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
