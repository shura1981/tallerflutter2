import 'package:flutter/material.dart';

import '../palatte.dart';
class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FilledButton(
        onPressed: () {
        
      }, child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text('Login', style: kTextStyleLato.copyWith(color: Colors.white) ,),
      )),
    );
  }
}
