// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class InfinityScroll extends StatefulWidget {
  InfinityScroll({Key? key}) : super(key: key);

  @override
  State<InfinityScroll> createState() => _InfinityScrollState();
}

class _InfinityScrollState extends State<InfinityScroll> {
  bool isload = true;
  List<Producto> lista = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _cargarData(),
        builder: (context, AsyncSnapshot<List<Producto>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            lista = snapshot.data!;
            return ListView.builder(
              itemBuilder: ((context, index) {
                final item = lista[index];
                var f = new NumberFormat('###,###', 'en_US');
                print(item.image);

                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: Image.network(item.image).image),
                  title: Text(item.producto),
                  subtitle: Text(f.format(item.valor)),
                );
              }),
              itemCount: lista.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<List<Producto>> _cargarData() async {
    final response = await rootBundle.loadString('data/productos.json');
    final Json = json.decode(response);
    List<Producto> data = [];
    for (var p in Json['data']) {
      data.add(Producto.fromJson(p));
    }

    return data;
  }

  Future<List<Producto>> _loadData() async {
    var url = Uri.parse('https://nutramerican.com/pagination?page=3&limit=12');
    print(url);
    final response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final json = jsonDecode(response.body);
    List<Producto> data = [];
    for (var p in json['data']) {
      data.add(Producto.fromJson(p));
    }
    return data;
  }
}

class Producto {
  String producto;
  String image;
  num valor;
  String categoria;
  Producto({
    required this.producto,
    required this.image,
    required this.valor,
    required this.categoria,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
        producto: json['producto'],
        categoria: json['category'],
        image: json['imageswebp']['medium'],
        valor: json['valor']);
  }
}
