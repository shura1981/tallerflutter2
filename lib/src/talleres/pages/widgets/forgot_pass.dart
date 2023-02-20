import 'package:flutter/material.dart';

import '../palatte.dart';
class ButtonForgotPass extends StatelessWidget {
  const ButtonForgotPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: TextButton(
          onPressed: () {},
          child: Text(
            'Forgot Password?',
            style: kInputStyleLato.copyWith(fontSize: 20),
          )),
    );
  }
}
