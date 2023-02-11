import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';


class GridResponsivePage extends StatefulWidget {
  const GridResponsivePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<GridResponsivePage> createState() => _GridResponsivePageState();
}

class _GridResponsivePageState extends State<GridResponsivePage> {
  bool _showbtn = false;
  final _controller = ScrollController();
  void _incrementCounter() {
    _controller.animateTo(
        //go to top of scroll
        0, //scroll offset to go
        duration: Duration(milliseconds: 500), //duration of scroll
        curve: Curves.fastOutSlowIn //scroll type
        );
    // setState(() {
    //   // This call to setState tells the Flutter framework that something has
    //   // changed in this State, which causes it to rerun the build method below
    //   // so that the display can reflect the updated values. If we changed
    //   // _counter without calling setState(), then the build method would not be
    //   // called again, and so nothing would appear to happen.
    //   _counter++;
    // });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      //scroll listener
      double showoffset =
          10.0; //Back to top botton will show on scroll offset 10.0

      if (_controller.offset > showoffset) {
        _showbtn = true;
        setState(() {
          //update state
        });
      } else {
        _showbtn = false;
        setState(() {
          //update state
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ResponsiveGridList(
        listViewBuilderOptions: ListViewBuilderOptions(controller: _controller),
        horizontalGridSpacing: 10, // Horizontal space between grid items
        verticalGridSpacing: 10, // Vertical space between grid items
        horizontalGridMargin: 20, // Horizontal space around the grid
        verticalGridMargin: 60, // Vertical space around the grid
        minItemWidth:
            350, // The minimum item width (can be smaller, if the layout constraints are smaller)
        minItemsPerRow:
            1, // The minimum items to show in a single row. Takes precedence over minItemWidth
        maxItemsPerRow:
            5, // The maximum items to show in a single row. Can be useful on large screens
        children: tarjetas(),
      ),
      floatingActionButton: _showbtn
          ? FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.arrow_drop_up),
            )
          : null, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

List<Widget> tarjetas() {
  return List.generate(
      20,
      (index) => const Center(
            child: Tarjeta(
              placeHolder: 'assets/load-loading.gif',
              image:
                  'https://imagenes.20minutos.es/files/image_990_v3/uploads/imagenes/2020/08/09/doutzen-kroes-cannes-2015.jpeg',
            ),
          ));
}

class Tarjeta extends StatelessWidget {
  const Tarjeta(
      {super.key,
      this.image =
          'https://imagenes.20minutos.es/files/image_990_v3/uploads/imagenes/2020/08/09/doutzen-kroes-cannes-2015.jpeg',
      this.placeHolder});
  final String? image;
  final String? placeHolder;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: ClipRRect(
        child: Stack(
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: placeHolder!,
              image: image!,
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
              child: Container(
                color: Colors.black12,
              ),
            )
          ],
        ),
      ),
    );

    // return Card(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   clipBehavior: Clip.antiAlias,
    //   child: Column(
    //     children: [
    //       FadeInImage(
    //         width: 300,
    //         height: 300,
    //         fit: BoxFit.cover,
    //         image: Image.network(
    //           'https://imagenes.20minutos.es/files/image_990_v3/uploads/imagenes/2020/08/09/doutzen-kroes-cannes-2015.jpeg',
    //         ).image,
    //         placeholder: Image.asset('assets/img/load-loading.gif').image,
    //       ),
    //       const Expanded(
    //         child: Padding(
    //           padding: EdgeInsets.all(8.0),
    //           child: Text('Sofia beltran'),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
