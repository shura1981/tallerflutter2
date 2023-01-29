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
  bool isload = false;
  bool isFirstLoad = false;
  List<Producto> lista = [];
  bool isNext = true;
  bool pullRefresh = false;
  ScrollController? controller = new ScrollController();
  int page = 1;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _loadData();
    // _cargarData();
    controller!.addListener(() {
      // print(
      //     '${controller!.position.pixels}, ${controller!.position.maxScrollExtent}');
      if ((controller!.position.pixels + 200) >=
          controller!.position.maxScrollExtent) {
        _loadData().then((value) {
          print(value);
          if (!value) return;
          if (controller!.position.pixels + 100 <=
              controller!.position.maxScrollExtent) return;

          controller!.animateTo(controller!.position.pixels + 120,
              duration: Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn);
        });
      }
    });
  }

  addItems() {
    lista.addAll(lista.map((e) => e).toList());
    print('Se añade... ${lista.length}');
  }

  double centerHorizontal(int withContainer) {
    return MediaQuery.of(context).size.width * 0.5 - withContainer * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Lista de productos')),
        body: isFirstLoad
            ? Stack(
                children: [
                  RefreshIndicator(
                    onRefresh: Refresh,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      controller: controller,
                      itemBuilder: ((context, index) {
                        final item = lista[index];
                        var f = new NumberFormat('###,###', 'en_US');
                        // print(item.image);

                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    FullScreenDialogProduct(item,
                                        'producto$index'), // fullscreenDialog: true,
                              ),
                            );
                          },
                          contentPadding: EdgeInsets.all(10),
                          title: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Container(
                                  color: Colors.grey.withOpacity(.3),
                                  child: Hero(
                                    tag: 'producto$index',
                                    child: Image.network(
                                      item.image,
                                      fit: BoxFit.contain,
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.producto.toLowerCase(),
                                      maxLines: 3,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.left,
                                    ),
                                    Divider(
                                        color: Colors.black.withOpacity(.3)),
                                    Text(
                                      f.format(item.valor),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      itemCount: lista.length,
                    ),
                  ),
                  if (isload)
                    Positioned(
                        bottom: 40,
                        left: centerHorizontal(60),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600.withOpacity(.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            )
                          ], color: Colors.white, shape: BoxShape.circle),
                          child: CircularProgressIndicator(),
                        ))
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  Future<bool> _cargarData() async {
    if (isload) {
      return false;
    }
    isload = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 3));
    final response = await rootBundle.loadString('data/productos.json');
    final Json = json.decode(response);
    List<Producto> data = [];
    for (var p in Json['data']) {
      data.add(Producto.fromJson(p));
    }
    lista.addAll([...data]);
    isFirstLoad = true;
    isload = false;
    setState(() {});
    print('carga... ${lista.length}');
    return true;
  }

  Future<void> Refresh() async {
    page = 1;
    pullRefresh = true;
    isNext = true;
    _loadData().then((value) => pullRefresh = false);
  }

  Future<bool> _loadData() async {
    if (isload) {
      return false;
    }
    isload = true;
    setState(() {});
    if (!isNext) {
      isFirstLoad = true;
      isload = false;
      setState(() {});
      return false;
    }

    var url =
        Uri.parse('https://nutramerican.com/pagination?page=$page&limit=12');
    print(url);
    final response = await http.get(url);
    print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    final Json = jsonDecode(response.body);
    isNext = Json['isNext'];
    page = Json['nextPage'];

    if (pullRefresh) {
      lista.clear();
    }
    List<Producto> data = [];
    for (var p in Json['data']) {
      data.add(Producto.fromJson(p));
    }
    lista.addAll([...data]);
    isFirstLoad = true;
    isload = false;
    setState(() {});
    print('carga... ${lista.length}');
    return true;
  }
}

class Producto {
  String producto;
  String image;
  num valor;
  String categoria;
  String intro;
  Producto(
      {required this.producto,
      required this.image,
      required this.valor,
      required this.categoria,
      required this.intro});

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      producto: json['producto'],
      categoria: json['category'],
      image: json['imageswebp']['medium'],
      valor: json['valor'],
      intro: json['intro'] ?? 'Sin intro',
    );
  }
}

class FullScreenDialogProduct extends StatelessWidget {
  FullScreenDialogProduct(this.param, this.tag);
  final Producto param;
  String tag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6200EE),
        title: const Text('Full-screen Dialog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Hero(tag: tag, child: Image.network(param.image)),
              Text(param.intro),
            ],
          ),
        ),
      ),
    );
  }
}
