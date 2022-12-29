import 'package:flutter/material.dart';
class VillanosInfo with ChangeNotifier {
  String _villano = '';
  Color _color = Colors.blue.shade400;

  String _poder = '';

  String get poder => _poder;

  set poder(String poder) {
    _poder = poder;
    notifyListeners();
  }

  String get villano {
    return _villano;
  }

Color get color => _color;
set color (Color color){
  _color= color;
   notifyListeners();
}

  set villano(String nombre) {
    _villano = nombre;
    notifyListeners();
  }
}
