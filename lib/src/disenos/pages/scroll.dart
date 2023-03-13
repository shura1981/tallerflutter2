import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  ScrollScreen({Key? key}) : super(key: key);
  final textStyle = TextStyle(
    fontSize: 50,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('ScrollScreen'),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.5, 0.5],
                  colors: const [Color(0xff5EEBC5), Color(0xff30BAD6)])),
          child: PageView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            children: [
              Page1(textStyle: textStyle),
              Page2(textStyle: textStyle),
            ],
          ),
        ));
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
    required this.textStyle,
  });

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset('assets/scroll-1.png').image)),
        ),
        SafeArea(
          bottom: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                '11',
                style: textStyle,
              ),
              Text(
                'Miércoles',
                style: textStyle,
              ),
              Expanded(child: Container()),
              Icon(
                Icons.keyboard_arrow_down,
                size: 100,
                color: Colors.white,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({
    super.key,
    required this.textStyle,
  });

  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff30BAD6),
      child: Center(
          child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(backgroundColor: Color(0xff0098FA)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Bienvenido',
            style: textStyle.copyWith(fontSize: 30),
          ),
        ),
      )),
    );
  }
}
