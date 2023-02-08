import 'package:flutter/material.dart';

class MediaQueryScreen extends StatelessWidget {
  const MediaQueryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    final height = (size.height * 0.5).ceilToDouble();
    final width = (size.width * 0.5).ceilToDouble();
    final boxSide = size.shortestSide - 20;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('MediaQueryScreen'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
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
