// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Map<String, Product> productFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, Product>(k, Product.fromJson(v)));

String productToJson(Map<String, Product> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Product {
  bool available;
  String description;
  String name;
  String? picture;
  double price;

  String id;

  Product({
    required this.id,
    required this.available,
    required this.description,
    required this.name,
    this.picture,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        available: json['available'],
        description: json['description'],
        name: json['name'],
        picture: json['picture'],
        price: json['price']?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'available': available,
        'description': description,
        'name': name,
        'picture': picture,
        'price': price,
      };

  Product copyWith({
    bool? available,
    String? description,
    String? name,
    String? picture,
    double? price,
  }) =>
      Product(
        id: id,
        available: available ?? this.available,
        description: description ?? this.description,
        name: name ?? this.name,
        picture: picture ?? this.picture,
        price: price ?? this.price,
      );

  Product copy() => Product(
        id: id,
        available: available,
        description: description,
        name: name,
        picture: picture,
        price: price,
      );
}
