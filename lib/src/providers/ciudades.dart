import 'dart:async';

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class CiudadesService {
 

  final StreamController<List<String>> _ciudades =  new StreamController();

  Stream<List<String>> get ciudades => _ciudades.stream;

CiudadesService(){
  filtrarCiudad(null);
}
  dispose() {
    print('cerrar _ciudades');
    _ciudades.close();
  }

  filtrarCiudad(String? ciudad) {
    _cargarCiudades(ciudad).then((places) {
      _ciudades.add(places);
    });
  }

  Future<List<String>> _cargarCiudades(String? ciudad) async {
    print(ciudad);
    List<String> ciudades = [];
    final data = await rootBundle.loadString('data/ciudades.json');
    List dataMap = json.decode(data);
    ciudades = dataMap.map((e) => e['ciudad']).toList().cast<String>();
    if (ciudad != null && ciudad.isNotEmpty) {
      return ciudades
          .where((element) =>
              element.toLowerCase().contains(ciudad.toString().toLowerCase()))
          .toList();
    } else {
      return ciudades;
    }
  }
}
