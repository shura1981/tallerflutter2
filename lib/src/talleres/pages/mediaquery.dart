import 'package:flutter/material.dart';

class MediaQueryScreen extends StatelessWidget {
  const MediaQueryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    EdgeInsets padding = MediaQuery.of(context).viewPadding;
    final height = (size.height * 0.5).ceilToDouble();
    final width = (size.width * 0.5).ceilToDouble();
    final boxSide = size.shortestSide - 20;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('MediaQueryScreen'),
          backgroundColor: Colors.transparent,
        ),
        body: NewWidget(size: size));
  }

  Center columRow(Orientation orientation, double boxSide) {
    return Center(
      child: Builder(
        builder: (context) {
          if (orientation == Orientation.landscape) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: layoutChildren(boxSide),
            );
            // return children();
          } else {
            return Column(
                mainAxisSize: MainAxisSize.min,
                children: layoutChildren(boxSide));
          }
        },
      ),
    );
  }

  List<Widget> layoutChildren(double boxSide) {
    return [
      Container(
        color: Colors.amber,
        height: boxSide,
        width: boxSide,
      ),
      Container(
        color: Color.fromARGB(255, 0, 231, 216),
        height: boxSide,
        width: boxSide,
      ),
    ];
  }
}

class viewPadding extends StatelessWidget {
  const viewPadding({
    super.key,
    required this.padding,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.55), BlendMode.darken),
              fit: BoxFit.cover,
              image: Image.network(
                      'https://smoda.elpais.com/wp-content/uploads/images/201137/rubias_654621993.jpg')
                  .image)),
      child: Padding(
        padding: padding,
        child: Align(
          alignment: Alignment(0, -1),
          child: Text(
            'Hola a todos',
            style: TextStyle(
                fontFamily: 'Babylonica', fontSize: 80, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

Widget children() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      AspectRatio(
        aspectRatio: 1,
        child: Container(
          color: Color.fromARGB(255, 0, 141, 206),
        ),
      ),
      AspectRatio(
        aspectRatio: 1,
        child: Container(
          color: Color.fromARGB(255, 231, 0, 227),
        ),
      ),
    ],
  );
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.amber,
            height: size.shortestSide,
            width: size.shortestSide,
          ),
          Container(
            color: Color.fromARGB(255, 0, 231, 216),
            height: size.shortestSide,
            width: size.shortestSide,
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Color.fromARGB(255, 0, 142, 5),
            ),
          )
        ],
      ),
    );
  }
}
