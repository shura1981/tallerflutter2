import 'package:flutter/material.dart';

import '../rutas.dart';

class HomeDisenos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Diseños')),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(DisenosAppRoute.menuOptions[index].icon),
              title: Text(DisenosAppRoute.menuOptions[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => DisenosAppRoute
                        .menuOptions[index].screen, // fullscreenDialog: true,
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: DisenosAppRoute.menuOptions.length),
    );
  }
}
