import 'package:flutter/material.dart';

class itemCard extends StatelessWidget {
  final String image;
  final String productName;
  final String currentPrice;
  final String oldPrice;

  itemCard({
    super.key,
    required this.productName,
    required this.image,
    required this.currentPrice,
    required this.oldPrice,
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
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Center(child: Image.asset(image, fit: BoxFit.contain)),
          ),

          const SizedBox(height: 8),

          Text(
            productName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 6),

          Text(
            currentPrice,
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            oldPrice,
            style: TextStyle(
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
