import 'package:flutter/material.dart';

import '../palatte.dart';

class InputLoginPass extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextStyle hintStyle;
  final TextInputAction textInputAction;
  final Icon icon;
  const InputLoginPass({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.hintStyle,
    required this.textInputAction,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[600]!.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        obscureText: true,
        style: kInputStyleLato,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            filled: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            fillColor: Colors.transparent,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText,
            prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: icon),
            hintStyle: hintStyle),
      ),
    );
  }
}
