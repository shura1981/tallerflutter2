import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/heroes.dart';
import '../models/villanos.dart';

class Body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

// final _heroe = Provider.of<HeroresInfo>(context, listen: false);
//   final _villano = Provider.of<VillanosInfo>(context, listen: false);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<HeroresInfo>( builder: (context, _heroe, child) => Text(_heroe.heroe, style: TextStyle(color: _heroe.color),),),
         Consumer<HeroresInfo>(builder: (context, _heroe, child) => Text(_heroe.poder,style: TextStyle(color: _heroe.color)),),
            Consumer<VillanosInfo>(builder: (context, _villano, child) =>   Text(_villano.villano, style: TextStyle(color: _villano.color),) ,),
         Consumer<VillanosInfo>(builder: (context, _villano, child) => Text(_villano.poder,style: TextStyle(color: _villano.color)),)
        ],
      ),
    );
  }
}
