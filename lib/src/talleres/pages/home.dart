import 'package:flutter/material.dart';

import '../rutas.dart';

class HomeTalleres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Talleres avanzado')),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(TalleresAppRoute.menuOptions[index].icon),
              title: Text(TalleresAppRoute.menuOptions[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => TalleresAppRoute
                        .menuOptions[index].screen, // fullscreenDialog: true,
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: TalleresAppRoute.menuOptions.length),
    );
  }
}
