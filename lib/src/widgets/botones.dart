import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller2/src/models/villanos.dart';

import '../models/heroes.dart';

class Botones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _heroe = Provider.of<HeroresInfo>(context, listen: false);
        final _villano = Provider.of<VillanosInfo>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'btn1',
          onPressed: () {
            _heroe.heroe = 'Superman';
            _heroe.poder = 'Super fuerza';
            _heroe.color = Colors.redAccent;
                 _villano.villano='Lex lutor';
            _villano.poder='inteligencia';
          },
          child: Icon(Icons.add_a_photo),
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          heroTag: 'btn2',
          onPressed: () {
            _heroe.heroe = 'Batman';
            _heroe.poder = 'Es rico';
            _heroe.color = Colors.black;
            _villano.villano='Guasón';
            _villano.poder='jodee';
          },
          child: Icon(Icons.read_more),
        )
      ],
    );
  }
}
