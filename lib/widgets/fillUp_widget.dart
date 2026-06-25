import 'package:flutter/material.dart';

class FillupWidget extends StatelessWidget {
  final String placeHolder;
  final IconData icon;
  final TextInputType keyboardType;

  const FillupWidget({
    super.key,
    required this.placeHolder,
    required this.icon,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffF6F3FF),
        contentPadding: EdgeInsets.symmetric(vertical: 20),
        hint: Text(
          placeHolder,
          style: TextStyle(color: Color(0xFF5B6475), fontSize: 15),
        ),
    
        prefixIcon: Icon(
          icon,
          color: Color(0xFF6D28FF),
        ),
    
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: BorderSide(color: Color(0xffE5E7EB)),
        ),
    
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: BorderSide(color: Color(0xffE5E7EB)),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
