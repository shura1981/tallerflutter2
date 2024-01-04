import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:taller2/src/productos/models/product.dart';
import 'package:http/http.dart' as http;

class ProducService extends ChangeNotifier {
  final String _baseUrl = 'https://flutter-930f1-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;

  ProducService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse('$_baseUrl/productos.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromJson(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();

    return products;
  }
}
