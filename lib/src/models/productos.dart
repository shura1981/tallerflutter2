// To parse this JSON data, do
//
//     final productos = productosFromJson(jsonString);

 
import 'dart:convert';

List<Productos> productosFromJson(String str) => List<Productos>.from(json.decode(str).map((x) => Productos.fromJson(x)));

String productosToJson(List<Productos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Productos {
    Productos({
      required this.producto,
      required this.descuento,
      required this.valor,
      required this.ruta,
      required this.keyfind,
      required this.promo,
      required this.images,
    });

    String producto;
    int descuento;
    int valor;
    String ruta;
    String keyfind;
    int promo;
    Images images;

    factory Productos.fromJson(Map<String, dynamic> json) => Productos(
        producto: json["producto"],
        descuento: json["descuento"],
        valor: json["valor"],
        ruta: json["ruta"],
        keyfind: json["keyfind"] ?? '',
        promo: json["promo"],
        images: Images.fromJson(json["images"]),
    );

    Map<String, dynamic> toJson() => {
        "producto": producto,
        "descuento": descuento,
        "valor": valor,
        "ruta": ruta,
        "keyfind": keyfind,
        "promo": promo,
        "images": images.toJson(),
    };
}

class Images {
    Images({
      required this.small,
      required this.medium,
      required this.big,
      required this.bigger,
      required this.seo,
    });

    String small;
    String medium;
    String big;
    String bigger;
    String seo;

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: json["small"],
        medium: json["medium"],
        big: json["big"],
        bigger: json["bigger"],
        seo: json["seo"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "big": big,
        "bigger": bigger,
        "seo": seo,
    };
}
