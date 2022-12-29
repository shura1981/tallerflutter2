import 'package:flutter/material.dart';

class HeroresInfo with ChangeNotifier {
  String _heroe = '';
  Color _color = Colors.blue.shade400;

  String _poder = '';

  String get poder => _poder;

  set poder(String poder) {
    _poder = poder;
    notifyListeners();
  }

  String get heroe {
    return _heroe;
  }

Color get color => _color;
set color (Color color){
  _color= color;
   notifyListeners();
}

  set heroe(String nombre) {
    _heroe = nombre;
    notifyListeners();
  }
}
