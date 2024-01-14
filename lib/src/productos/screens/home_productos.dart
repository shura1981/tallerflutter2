import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller2/src/productos/models/product.dart';
import 'package:taller2/src/productos/screens/loading_screen.dart';
import 'package:taller2/src/productos/services/authentication_service.dart';
import 'package:taller2/src/productos/services/product_service.dart';
import 'package:taller2/src/productos/widgets/widgets.dart';

class HomeProductosScreen extends StatelessWidget {
  const HomeProductosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProducService>(context);

    if (productService.isLoading) {
      return const LoadingScreen();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('HomeProductosScreen'),
          actions: [
            IconButton(
                onPressed: () async {
               await AuthenticationService.logout();
              Navigator.pushReplacementNamed(context, 'login/productos');
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final Product product = productService.products[index];
            return GestureDetector(
                onTap: () {
                  productService.selectedProduct = product.copy();
                  Navigator.pushNamed(context, 'product');
                },
                child: ProductCard(
                  product: product,
                ));
          },
          itemCount: productService.products.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // generar un id para el producto
            final id = UniqueKey().toString();
            productService.selectedProduct = new Product(
                picture: '',
                available: false,
                name: '',
                price: 0,
                description: '',
                id: id);
            Navigator.pushNamed(context, 'product');
          },
          child: Icon(Icons.add),
        ));
  }
}
