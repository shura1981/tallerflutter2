import 'package:flutter/material.dart';
import 'package:taller2/src/talleres/pages/widgets/list_search.dart';

import '../../providers/ciudades.dart';

class SelectList extends StatefulWidget {
  SelectList({Key? key}) : super(key: key);

  @override
  State<SelectList> createState() => _SelectListState();
}

class _SelectListState extends State<SelectList> {
  String title = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seleccionar item de lista')),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<String>(
                  builder: (BuildContext context) =>
                      ListSearch(), // fullscreenDialog: true,
                ),
              ).then((value) {
                         if (value == null) return;
                setState(() {
                  title = value;
                });
              });
            },
            child: Text('Escoge una ciudad'),
          ),
          Text(title),
        ],
      )),
    );
  }
}
