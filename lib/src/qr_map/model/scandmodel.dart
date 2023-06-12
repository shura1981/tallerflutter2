class ScanModel {
  int id;
  String tipo;
  String valor;

  ScanModel({
    required this.id,
    required this.tipo,
    required this.valor,
  }){
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
