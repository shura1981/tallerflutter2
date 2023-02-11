import 'package:flutter/material.dart';

import '../rutas.dart';

class QRMapScreen extends StatelessWidget {
  const QRMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(QrMapAppRoute.menuOptions[index].icon),
              title: Text(QrMapAppRoute.menuOptions[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => QrMapAppRoute
                        .menuOptions[index].screen, // fullscreenDialog: true,
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: QrMapAppRoute.menuOptions.length),
    );
  }
}
