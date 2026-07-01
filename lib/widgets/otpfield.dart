import 'package:flutter/material.dart';

class OtpField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode currentfocus;
  final FocusNode? previousfocus;
  final FocusNode? nextfocus;
  const OtpField({
    required this.currentfocus,
    this.previousfocus,
    this.nextfocus,
    required this.controller,
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        focusNode: currentfocus,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder()
        ),
        
        onChanged: (value) {
           if (value.length == 1 && nextfocus != null) {
                FocusScope.of(context).requestFocus(nextfocus);
                 }

           if (value.isEmpty && previousfocus != null) {
              FocusScope.of(context).requestFocus(previousfocus);
              }
          },

      ),
    );
  }
}