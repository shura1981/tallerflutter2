import 'package:flutter/material.dart';
import 'package:taller_flutter/src/utils/helper_layout.dart';

class LayoutBuilderScreen extends StatelessWidget {
  const LayoutBuilderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LayoutBuilderScreen'),
        ),
        body: Builder1());
  }
}

class Builder1 extends StatelessWidget {
  const Builder1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, contraints) {
        final isMobile = contraints.maxWidth <= 600 ? true : false;

        print('isMobile $isMobile');
        final list = generateList();
        return isMobile
            ? ListView.builder(
                // scrollDirection: isMobile ? Axis.vertical : Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) => list[index],
              )
            : GridView.count(children: list, crossAxisCount: 4);
      },
    );
  }
}

List<Widget> generateList() {
  return List.generate(
    30,
    (index) => Container(
        width: 400,
        height: 400,
        child: Center(child: Text('${index + 1}')),
        color: (index % 2 == 0) ? Colors.red : Colors.green),
  );
}

class BuilderLayoutScreen extends StatelessWidget {
  const BuilderLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print('snapshot ${constraints.maxWidth}');
      final width = constraints.maxWidth;
      return HelperLayout(width: width);
    });
  }
}
