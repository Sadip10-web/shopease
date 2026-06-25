import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final Color backgroundColor;

  const CategoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: backgroundColor,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(
            child: Center(child: Image.asset(image, fit: BoxFit.contain)),
          ),

          const SizedBox(height: 8),

          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 4),

          Row(
            children: [
              const Text(
                "125 Products",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),

              const Spacer(),

              Container(
                height: 28,
                width: 28,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Icon(Icons.arrow_forward, size: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
