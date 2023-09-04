import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.onPressed, required this.text})
      : super(key: key);
  final Function onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      // side: const BorderSide(color: Colors.blueAccent)
    ))
      ),
      onPressed: () => onPressed(), child: Text(text));
  }
}
