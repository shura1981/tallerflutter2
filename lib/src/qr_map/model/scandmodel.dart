import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class ScanModel {
  int id;
  String tipo;
  String valor;

  LatLng get getLatLng {
    final latLng = valor.substring(4).split(',');
    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);

    return LatLng(lat, lng);
  }

  ScanModel({
    required this.id,
    required this.tipo,
    required this.valor,
  }) {
    if (valor.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'geo';
    }
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => new ScanModel(
        id: json['id'],
        tipo: json['tipo'],
        valor: json['valor'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'tipo': tipo,
        'valor': valor,
      };
}
