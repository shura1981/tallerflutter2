import 'dart:math' show Random;

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);
  double _increment = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation container')),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration:
              BoxDecoration(borderRadius: _borderRadius, color: _color),
               duration: const Duration(milliseconds: 400),
               curve: Curves.easeOutCubic,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _animate, child: Icon(Icons.play_arrow)),
    );
  }

  void _animate() {
    print('animar');
    setState(() {
      // _increment++;
      // final double value = _increment * 10;
      final random = Random();
      _width = random.nextInt(300).toDouble() + 70;
      _height = random.nextInt(300).toDouble() + 70;
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(300), 1);
      _borderRadius =
          BorderRadius.circular(random.nextInt(100).toDouble() + 10);
    });
  }
}
