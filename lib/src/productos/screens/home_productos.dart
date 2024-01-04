import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller2/src/productos/services/product_service.dart';
import 'package:taller2/src/productos/widgets/widgets.dart';

class HomeProductosScreen extends StatelessWidget {
  const HomeProductosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

final productService= Provider.of<ProducService>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('HomeProductosScreen'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'product'),
              child: ProductCard());
          },
          itemCount: 10,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ));
  }
}
