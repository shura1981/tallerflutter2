import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/heroes.dart';
import '../models/villanos.dart';

class Body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

final _heroe = Provider.of<HeroresInfo>(context);
  final _villano = Provider.of<VillanosInfo>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_heroe.heroe, style: TextStyle(color: _heroe.color),),
         Text(_heroe.poder,style: TextStyle(color: _heroe.color)),
              Text(_villano.villano, style: TextStyle(color: _villano.color),),
         Text(_villano.poder,style: TextStyle(color: _villano.color)),
        ],
      ),
    );
  }
}
