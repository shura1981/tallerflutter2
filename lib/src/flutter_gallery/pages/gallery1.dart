import 'package:flutter/material.dart';

class Gallery1 extends StatelessWidget {
   
  const Gallery1({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(title: Text('Gallery1'),),
      body: Center(
         child: Text('Gallery1'),
      ),
    );
  }
}