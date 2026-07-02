import 'package:flutter/material.dart';

class OrderCardWidget extends StatelessWidget {
  final String shopName;
  final String status;

  final String productName;
  final String color;
  final String price;
  final String qty;
  final String total;
  final String image;
 final VoidCallback? onTap;


  final String? leftButtonText;
  final String? rightButtonText;

  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;

  const OrderCardWidget({
    super.key,
    required this.shopName,
    required this.status,
    required this.productName,
    required this.color,
    required this.price,
    required this.qty,
    required this.total,
    required this.image,
    this.leftButtonText,
    this.rightButtonText,
    this.onLeftTap,
    this.onRightTap,
   this.onTap,
  });

Widget _button(String text, VoidCallback? onTap, bool filled) {
  return Expanded(
    child: SizedBox(
      height: 38,
      child: filled
          ? ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7B2CF5),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF7B2CF5),
                side: const BorderSide(
                  color: Color(0xFF7B2CF5),
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Row(
            children: [
              const Icon(Icons.store),
              const SizedBox(width: 8),
              Text(shopName),
              const Spacer(),
             Text(
  status,
  style: const TextStyle(
    color: Color(0xFF7B2CF5),
    fontSize: 13,
    fontWeight: FontWeight.w600,
  ),
),
            ],
          ),

          const SizedBox(height: 16),
// PRODUCT
InkWell(
  onTap: onTap,
  child: Row(
    children: [
      Container(
        width: 85,
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade100,
          image: DecorationImage(
        image: image.startsWith('http')
        ? NetworkImage(image)
         : AssetImage(image) as ImageProvider,
  fit: BoxFit.cover,
),
        ),
      ),

      const SizedBox(width: 10),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 6),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFEAE6E6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Color: $color",
                style: const TextStyle(fontSize: 12),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "Qty: $qty",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            Row(
              children: [
                const Spacer(),
                Text(
                  "Total ($qty Item${qty == "1" ? "" : "s"}): ",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  total,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
),

          const SizedBox(height: 12),

// BUTTONS
if (leftButtonText != null || rightButtonText != null)
  Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      SizedBox(
        width: 228, 
        child: Row(
          children: [
            if (leftButtonText != null)
              Expanded(
                child: SizedBox(
                  height: 34,
                  child: OutlinedButton(
                    onPressed: onLeftTap,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: const Color(0xFF7B2CF5),
                      side: const BorderSide(color: Color(0xFF7B2CF5)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(leftButtonText!),
                    ),
                  ),
                ),
              ),

            if (leftButtonText != null && rightButtonText != null)
              const SizedBox(width: 8),

            if (rightButtonText != null)
              Expanded(
                child: SizedBox(
                  height: 34,
                  child: ElevatedButton(
                    onPressed: onRightTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7B2CF5),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(rightButtonText!),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ],
  ),
        ],
      ),
    );
  }
}