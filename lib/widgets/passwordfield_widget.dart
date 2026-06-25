
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PasswordFieldWidget extends StatelessWidget {
  final String text;
  final String hintText;
   const PasswordFieldWidget({
    required this.text,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5B6475),
                ),
              ),
              Gap(12),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF6F3FF),
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  hint: Text(
                    hintText,
                    style: TextStyle(color: Color(0xFF5B6475), fontSize: 15),
                  ),
              
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xFF6D28FF),
                    // size: 20,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color:Color(0xFF6D28FF) ,
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
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
              ),
              Gap(30)
              
              
              
            ],
          ),
        );
  }
}