// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_new

import 'dart:async';

import 'package:flutter/material.dart';

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
double fontsize=30.0;
_MyAppState(){
  // runs every 1 second
star();
pause(5).then((value) => print("inicia el cliclo"));
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
home: Center(child: Text("hola mundo",textAlign: TextAlign.center ,style: TextStyle(color: Colors.yellow, fontSize: fontsize, letterSpacing: 1.5, fontWeight: FontWeight.w300, backgroundColor: Colors.blue ),)) );
  }


Future pause(int delay)=> Future.delayed( Duration( seconds: delay ) );
void star(){
  Timer.periodic(new Duration(seconds: 5), (timer) {
setState(() {
     debugPrint(timer.tick.toString());
   fontsize+=0.5;
   print('fuente: $fontsize');
});
});

}


}