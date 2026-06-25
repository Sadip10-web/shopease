import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Color color;
  final VoidCallback? onPressed;
  
  const ButtonWidget({
    super.key,
    required this.buttonText,
    required this.backgroundColor,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        Expanded(
          child: FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(15),
              ),
              elevation: 0,
            ),
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color:color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


