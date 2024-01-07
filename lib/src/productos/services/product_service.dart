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

  Future<bool> createProduct(Product product) async {
    final url = Uri.parse('$_baseUrl/productos');
    final resp = await http.post(url,
        headers: headers, body: jsonEncode(product.toJson()));
    if (resp.statusCode == 200) {
      _actualizarProducto(product);
      return true;
    }
    throw Exception('Error al crear producto');
  }

// crear método que reciba un producto y busque en la lista de productos por id y lo actualice
  bool _actualizarProducto(Product product) {
    bool actualizado = false;
    final index = products
        .indexWhere((element) => element.id == product.id); //declarativo
    if (index != -1) {
      products[index] = product;
      actualizado = true;
    } else {
      products.add(product);
    }
    notifyListeners();

    // for (int i = 0; i < products.length; i++) { //imperativo
    //   if (products[i].id == product.id) {
    //     products[i] = product;
    //     actualizado = true;
    //     notifyListeners();
    //     break;
    //   }
    // }
    return actualizado;
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
