import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:taller_flutter/src/productos/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:taller_flutter/src/productos/services/authentication_service.dart';
import 'package:taller_flutter/src/productos/services/camara_service.dart';

class ProducService extends ChangeNotifier {
  final String _baseUrl = 'https://www.api.megaplexstars.com/api';
  Map<String, String>? headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Y2tfZGJjMDI5ZTA2ZWJmZTdmNjg5YjJmZTRiOGJkNzhjNWEyNzlhN2IxYjpjc180ODhjOTNjOTlhOTE3OTc4NzU4N2Y0NmIzYmIyNWZkYzNmYzdlZDBj'
  };

  final List<Product> products = [];
  bool isLoading = true;
  bool isSaving = false;

  Product? selectedProduct;

  File? newPitureFile;
  String? imageBase64;

  updateImageSelectedProduct(String value) {
    selectedProduct!.picture = value;
    notifyListeners();
  }

  clearSelectedProduct() {
    newPitureFile = null;
    imageBase64 = null;
  }

  updateImageSelectedProductV2(ResponseCropperImage value) {
    imageBase64 = value.img64;
    newPitureFile = File.fromUri(Uri(path: value.file!.path));
    notifyListeners();
  }

  set isSavingProduct(bool value) {
    isSaving = value;
    notifyListeners();
  }

  Future<bool> createProductOrUpdate(Product product) async {
    isSavingProduct = true;
    bool response = false;
    notifyListeners();
    final url = Uri.parse('$_baseUrl/productos');
    final headersJwt = await AuthenticationService.getHeaderJwt();
    final resp = await http.post(url,
        headers: headersJwt, body: jsonEncode(product.toJson()));
    if (resp.statusCode == 200) {
      _actualizarProducto(product);
      clearSelectedProduct();
      response = true;
    }
    isSavingProduct = false;
    return response;
  }

  Future<String> updateImage(String imageBase64) async {
    final url = Uri.parse('$_baseUrl/productos/subir-imagen');
    final data = {'image': imageBase64};
    final headersJwt = await AuthenticationService.getHeaderJwt();
    final resp =
        await http.post(url, headers: headersJwt, body: jsonEncode(data));
    if (resp.statusCode == 201) {
      final response = json.decode(resp.body);
      return response['url'];
    }
    throw Exception('Error al crear producto');
  }

  Future<String> updateImageFile(File? newPitureFile) async {
    if (newPitureFile == null) {
      throw Exception('No hay imagen para subir');
    }
    final headersJwt = await AuthenticationService.getHeaderJwt();
    headersJwt['Content-Type'] = 'multipart/form-data';
    final url = Uri.parse('$_baseUrl/productos/subir-imagen/file');
    final imageUploadRequest = http.MultipartRequest('POST', url)
      ..headers.addAll(headersJwt);
    final file = await http.MultipartFile.fromPath('image', newPitureFile.path);
    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    if (resp.statusCode == 201) {
      final response = json.decode(resp.body);
      return response['url'];
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
    return actualizado;
  }

  Future<List<Product>> loadProducts() async {
    products.clear();

    final headersJwt = await AuthenticationService.getHeaderJwt();
    final url = Uri.parse('$_baseUrl/productos');
    final resp = await http.get(url, headers: headersJwt);

    if (resp.statusCode != 200) {
      throw Exception('Error al obtener productos');
    }

    final data = json.decode(resp.body);

    List<Map<String, dynamic>> list = List.from(data['payload']);
    for (var element in list) {
      final tempProduct = Product.fromJson(element);
      products.add(tempProduct);
    }

    return products;
  }
}
