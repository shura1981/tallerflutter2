import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
class _MenuProvider{

List<dynamic> opciones= []; 
_MenuProvider(){
}

Future<List<dynamic>> cargarData() async {
final data= await rootBundle.loadString('data/menu_opts.json');
final dataMap= json.decode(data);
opciones= dataMap['rutas'];
return opciones;
}


}

final menuProvider= new _MenuProvider();