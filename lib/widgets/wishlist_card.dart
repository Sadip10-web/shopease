import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(5),
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
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            oldPrice,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
