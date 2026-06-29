import 'package:flutter/material.dart';

Widget filterButton({
  required IconData icon,
  required String title,
  required List<String> options,
}) {
  return MenuAnchor(
    builder: (context, controller, child) {
      return InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: () {
          controller.isOpen ? controller.close() : controller.open();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black12)],
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.deepPurple, size: 16),

              const SizedBox(width: 6),

              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              AnimatedRotation(
                turns: controller.isOpen ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.deepPurple,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      );
    },

    menuChildren: options.map((option) {
      return MenuItemButton(
        onPressed: () {
          print("$title : $option");
        },
        child: Text(option),
      );
    }).toList(),
  );
}
