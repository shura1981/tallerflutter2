import 'package:flutter/material.dart';
import 'item_sliderscreen.dart';

class ListviewBuilder extends StatelessWidget {
  const ListviewBuilder({Key? key}) : super(key: key);
  PageRouteBuilder _createRoute(tag, img) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, _) {
        // return FadeTransition(
        //   opacity: animation,
        //   child: ItemSliderScreem(tag, img),
        // );

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: ItemSliderScreem(tag, img),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                onTap: () {
                  // final route = MaterialPageRoute(builder: (context)=> ItemSliderScreem('imagen${index + 1}'));
                  String image =
                      'https://picsum.photos/500/300?image=${index + 1}';
                  Navigator.of(context).push(
                    _createRoute('imagen${index + 1}', image),
                  );
                  // Navigator.pushNamed(context, 'itemslider');
                  print('hola');
                },
                child: Hero(
                  tag: 'imagen${index + 1}',
                  child: FadeInImage(
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      image: NetworkImage(
                          'https://picsum.photos/500/300?image=${index + 1}')),
                ),
              );
            }),
      ),
    );
  }
}
