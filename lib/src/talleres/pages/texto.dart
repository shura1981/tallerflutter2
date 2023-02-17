import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  TextScreen({Key? key}) : super(key: key);
  final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()
    ..onTap = () {
      debugPrint('Hello world');
    };
  final _textStyle = TextStyle(fontFamily: 'Babylonica', fontSize: 80);
  final _textStyleLato = TextStyle(
    fontFamily: 'Lato',
    fontSize: 40,
    decorationThickness: 2.0,
    decorationColor: Colors.redAccent,
    decorationStyle: TextDecorationStyle.dashed,
    letterSpacing: 12.0,
    wordSpacing: 14.0,
    foreground: Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke,
    // shadows: const [
    //   Shadow( color: Color.fromARGB(255, 255, 75, 75), blurRadius:  2.0, offset: Offset(3, 1))
    // ],
    // decoration: TextDecoration.combine(
    //     [TextDecoration.underline, TextDecoration.overline])
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextScreen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
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
              Text(
                ''' Enumerating objects: 49, done. Counting objects: 100% (49/49), done. Delta compression using up to 8 threads. Compressing objects: 100% (33/33), done.''',
                // maxLines: 2,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(),
              ),
              SizedBox(height: 30),
              RichText(
                  text: TextSpan(
                      text: "don't have an Account? ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: [
                    TextSpan(
                        text: 'Registrer',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                        recognizer: _gestureRecognizer)
                  ])),
              SizedBox(height: 10),
              RichText(
                  text: TextSpan(
                      text: 'Share',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children:  [
                    WidgetSpan(
                        child: IconButton(icon:Icon(Icons.share), onPressed: () { 
                          print('share');
                         },),
                        alignment: PlaceholderAlignment.middle)
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
