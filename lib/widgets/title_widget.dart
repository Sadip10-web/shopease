import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  String title;
  TitleWidget({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w600,
        color: Color(0xff5B6475),
      ),
    );
  }
}