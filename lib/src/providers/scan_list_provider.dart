import 'package:flutter/material.dart';

import '../qr_map/model/scandmodel.dart';
import 'db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  String _tipoSeleccionado = 'geo';
  List<ScanModel> scans = [];

  String get tipoSeleccionado {
    return _tipoSeleccionado;
  }

  set tipoSeleccionado(String tipo) {
    _tipoSeleccionado = tipo;
    notifyListeners();
  }

  Future<ScanModel> nuevoScand(ScanModel model) async {
    print(model.toJson());

    final id = await DBProvider.db.nuevoScand(model);
    model.id = id;
    scans.add(model);
    notifyListeners();
    return model;
  }

  cargarScans() async {
    scans = [];
    final list = await DBProvider.db.getScandAll();
    if (list.isNotEmpty) {
      scans = [...list as List<ScanModel>];
    }
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    scans = [];
    final list = await DBProvider.db.getScandByType(tipo);
    list.forEach((element) {
      print(element!.tipo);
    });
    if (list.isNotEmpty) {
      scans = [...list as List<ScanModel>];
    }
    notifyListeners();
  }

  deleteScand(int i) async {
    await DBProvider.db.deleteScand(i);
    scans.removeWhere((element) => element.id == i);
    notifyListeners();
  }

  deleteScandAll() async {
    await DBProvider.db.deleteScandAll();
    scans.clear();
    notifyListeners();
  }

  updateScand(int i, ScanModel model) async {
    await DBProvider.db.updateScand(i, model);
    final item = scans.firstWhere((element) => element.id == i);
    final index = scans.indexOf(item);
    scans[index] = model;
    notifyListeners();
  }
}
