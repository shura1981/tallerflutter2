import 'package:flutter/material.dart';

class PateTitle extends StatelessWidget {

final _style= TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:   [
          Text('Classfy transaction', style: _style.copyWith(fontSize: 20),),
          SizedBox(height:10),
          Text('Classfy this transaction into a particular category', style: _style,)
        ]),
      ),
    );
  }
}
