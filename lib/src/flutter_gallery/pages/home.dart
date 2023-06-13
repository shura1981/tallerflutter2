import 'package:flutter/material.dart';

import '../router.dart';

class HomeGalleryScreen extends StatelessWidget {
  const HomeGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Talleres avanzado')),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(FlutterGalleryRoute.menuOptions[index].icon),
              title: Text(FlutterGalleryRoute.menuOptions[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => FlutterGalleryRoute
                        .menuOptions[index].screen, // fullscreenDialog: true,
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: FlutterGalleryRoute.menuOptions.length),
    );
  }
}
