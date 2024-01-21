import 'package:flutter/material.dart';
import 'package:taller_flutter/src/providers/productos_block.dart';

class Bloc extends StatefulWidget {
  Bloc({Key? key}) : super(key: key);

  @override
  State<Bloc> createState() => _BlocState();
}

class _BlocState extends State<Bloc> {
  final productosBloc = ProductosBlock();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productosBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: StreamBuilder<Object>(
              stream: productosBloc.productosContador,
              builder: (context, snapshot) {
                return Text('Productos (${snapshot.data ?? 0})');
              })),
      body: StreamBuilder(
        stream: productosBloc.getProductos,
        builder: (_, AsyncSnapshot<List<String>> snapshot) {
          final productos = snapshot.data ?? [];
          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (_, i) {
              return ListTile(
                title: Text(productos[i]),
              );
            },
          );
        },
      ),
    );
  }
}
