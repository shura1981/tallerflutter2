import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// import '../models/heroes.dart';
// import '../models/villanos.dart';
import '../models/models.dart' show HeroresInfo;
import '../models/models.dart' show VillanosInfo;
import '../widgets/body.dart';
import '../widgets/botones.dart';

class ProviderScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

final _heroe = Provider.of<HeroresInfo>(context);
        final _villano = Provider.of<VillanosInfo>(context);
// Future.delayed(Duration(seconds: 10)).then((value) {
//   print(value);
//   _heroe.heroe='flash';
//   _villano.villano='capitán bumerang';
// });


    return Scaffold(
      appBar: AppBar(title: Text(_heroe.heroe +' Vs '+ _villano.villano)),
      body: Body(),
      floatingActionButton: Botones()
    );
  }
}


