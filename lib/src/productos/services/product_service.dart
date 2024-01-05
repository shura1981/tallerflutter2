import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:taller2/src/productos/models/product.dart';
import 'package:http/http.dart' as http;

class ProducService extends ChangeNotifier {
  final String _baseUrl =
      'https://www.nutramerican.com/api_MegaplexStar/api/service.php';
  Map<String, String>? headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Y2tfZGJjMDI5ZTA2ZWJmZTdmNjg5YjJmZTRiOGJkNzhjNWEyNzlhN2IxYjpjc180ODhjOTNjOTlhOTE3OTc4NzU4N2Y0NmIzYmIyNWZkYzNmYzdlZDBj'
  };

  final List<Product> products = [];
  bool isLoading = true;

  Product? selectedProduct;

  ProducService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();

    products.clear();

    final url = Uri.parse('$_baseUrl/productos');
    final resp = await http.get(url, headers: headers);
    final data = json.decode(resp.body);

    if (data != null) {
      List<Map<String, dynamic>> list = List.from(data['payload']);
      for (var element in list) {
        final tempProduct = Product.fromJson(element);
        products.add(tempProduct);
      }
    }

    isLoading = false;
    notifyListeners();

    return products;
  }
}
