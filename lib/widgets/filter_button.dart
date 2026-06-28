import 'package:flutter/material.dart';

Widget filterButton({required IconData icon, required String title}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black12)],
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.deepPurple, size: 15),
        const SizedBox(width: 4),

        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 10),
            overflow: TextOverflow.ellipsis,
          ),
        ),

        const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.deepPurple,
          size: 15,
        ),
      ],
    ),
  );
}
