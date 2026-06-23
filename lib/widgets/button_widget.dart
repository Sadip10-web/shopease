import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String buttonText;
  Color backgroundColor;
  ButtonWidget({
    super.key,
    required this.buttonText,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        elevation: 0,
      ),
      onPressed: () {},
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}


