import 'package:flutter/material.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextField(
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder()
        ),
      ),
    );
  }
}