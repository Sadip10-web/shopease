import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

ValueNotifier<bool> showPassword = ValueNotifier(false);

class PasswordFieldWidget extends StatefulWidget {
  final String text;
  final String hintText;
  const PasswordFieldWidget({
    required this.text,
    required this.hintText,
    super.key,
  });

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
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
                widget.hintText,
                style: TextStyle(color: Color(0xFF5B6475), fontSize: 15),
              ),

              prefixIcon: Icon(
                Icons.lock, 
                color: Color(0xFF6D28FF)
              ),

              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    
                  });
                  showPassword.value = !showPassword.value;
                },
                icon: ValueListenableBuilder(
                  valueListenable: showPassword,
                  builder: (context, value, child) {
                    return Icon(
                      value ? Icons.visibility : Icons.visibility_off,
                    );
                  },
                ),
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
            keyboardType: TextInputType.text,
            obscureText: !showPassword.value,
          ),
          Gap(30),
        ],
      ),
    );
  }
}
