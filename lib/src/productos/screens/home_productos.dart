import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_flutter/src/productos/models/product.dart';
import 'package:taller_flutter/src/productos/services/authentication_service.dart';
import 'package:taller_flutter/src/productos/services/product_service.dart';
import 'package:taller_flutter/src/productos/widgets/widgets.dart';

class HomeProductosScreen extends StatelessWidget {
  const HomeProductosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProducService>(context, listen: false);

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
        body: FutureBuilder<List<Product>>(
            future: productService.loadProducts(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator()); // Loading indicator
              }
              if (snapshot.hasError) {
                return Center(
                    child: Text('Error: ${snapshot.error}')); // Error handling
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                    child: Text('No products found')); // Handle empty data
              }

              return RefreshIndicator(
                onRefresh: productService.loadProducts,
                child: ListView.builder(
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
              );
            }),
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
