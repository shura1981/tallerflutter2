import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  TextScreen({Key? key}) : super(key: key);
  final _textStyle = TextStyle(fontFamily: 'Babylonica', fontSize: 80);
  final _textStyleLato = TextStyle(
      fontFamily: 'Lato',
      fontSize: 40,
      decorationThickness: 2.0,
      decorationColor: Colors.redAccent,
      decorationStyle: TextDecorationStyle.dashed,
      letterSpacing: 12.0,
      wordSpacing: 14.0,
      shadows: const [
        Shadow( color: Color.fromARGB(255, 255, 75, 75), blurRadius:  2.0, offset: Offset(3, 1))
      ],
      // decoration: TextDecoration.combine(
      //     [TextDecoration.underline, TextDecoration.overline])
          
          );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextScreen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'TextScreen',
              style: _textStyle,
            ),
            Text(
              'Hola mundo',
              style: _textStyleLato.copyWith(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}
