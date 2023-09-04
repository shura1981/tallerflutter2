import 'package:flutter/material.dart';

import '../widgets/responsive/responsive.dart';

class MediaQueryOrientation extends StatelessWidget {
  const MediaQueryOrientation({Key? key}) : super(key: key);
  final TextStyle style = const TextStyle(color: Colors.white, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    //  return MediaQuerySafffold(style: style);
    // return MyorientationBuilder(style: style);
    // return MyorientationBuilder2(style: style);
    return const ResponsiveLayout(
      mobileBody: MobileBody(),
      tabletBody: DesktopBody(),
    );
    // return const MediaQuerySafffold2();
  }
}

class MyorientationBuilder extends StatelessWidget {
  const MyorientationBuilder({
    Key? key,
    required this.style,
  }) : super(key: key);

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final isPortrait = orientation == Orientation.portrait;
          return isPortrait
              ? Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'portrait',
                      style: style,
                    ),
                  ),
                )
              : Container(
                  color: Colors.redAccent,
                  child: Center(
                    child: Text(
                      'landscape',
                      style: style,
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class MyorientationBuilder2 extends StatelessWidget {
  const MyorientationBuilder2({
    Key? key,
    required this.style,
  }) : super(key: key);

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        final isPortrait = orientation == Orientation.portrait;
        final isMobile = MediaQuery.of(context).size.shortestSide < 600;
        return Scaffold(
          appBar: AppBar(title: const Text('orientation')),
          drawer: isMobile
              ? Drawer(
                  child: Container(
                    color: Colors.blue,
                    width: 300,
                    child: const Center(child: Text('SideBar')),
                  ),
                )
              : null,
          body: Row(
            children: [
              if (!isMobile)
                Container(
                  color: Colors.blue,
                  width: 300,
                  child: const Center(
                    child: Text('Sidebar'),
                  ),
                ),
              Expanded(
                child: GridView.count(
                    crossAxisCount: isPortrait ? 2 : 3,
                    children: List.generate(
                        40,
                        (index) => Card(
                              color: Colors.orange,
                              child: Center(
                                child: Text(
                                  'Item $index',
                                  style: style,
                                ),
                              ),
                            ))),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MediaQuerySafffold extends StatelessWidget {
  const MediaQuerySafffold({
    Key? key,
    required this.style,
  }) : super(key: key);

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: isPortrait
          ? Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'portrait',
                  style: style,
                ),
              ),
            )
          : Container(
              color: Colors.redAccent,
              child: Center(
                child: Text(
                  'landscape',
                  style: style,
                ),
              ),
            ),
    );
  }
}

class MediaQuerySafffold2 extends StatelessWidget {
  const MediaQuerySafffold2({super.key});

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width.truncateToDouble();
    double screenHeigth = MediaQuery.of(context).size.height.truncateToDouble();

    return Scaffold(
      body: Row(
        children: [
          if (isDesktop(context))
            Container(
              color: Colors.blue,
              width: 200,
              child: Center(
                child: Text('ancho: $screenWidth, alto: $screenHeigth'),
              ),
            ),
          Expanded(
              child: Container(
            color: Colors.orange,
            child: const Center(
              child: Text('data'),
            ),
          ))
        ],
      ),
    );
  }
}
