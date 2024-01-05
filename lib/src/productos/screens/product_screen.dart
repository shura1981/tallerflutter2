import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:taller2/src/productos/providers/product_form_provider.dart';
import 'package:taller2/src/productos/services/product_service.dart';
import 'package:taller2/src/productos/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProducService>(context);

    //para que se pueda acceder a los datos del producto seleccionado
    return ChangeNotifierProvider(
        create: (_) => ProductFormProvider(productService.selectedProduct!),
        child: _ProductScreenBody(productService: productService));
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    required this.productService,
  });

  final ProducService productService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false, //para que la appbar no se vea
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Nuevo Producto'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.camera_alt_outlined,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(
                  url: productService.selectedProduct!.picture,
                )
              ],
            ),
            SizedBox(height: 20),
            _ProductForm(),
            SizedBox(height: 150),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save_outlined),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm();

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              initialValue: product.name,
              onChanged: (value) => product.name = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El nombre es obligatorio';
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: 'Nombre del producto',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(height: 30),
            TextFormField(
              initialValue: '${product.price}',
              keyboardType: TextInputType.number,
              inputFormatters: [
                //para que solo se pueda ingresar numeros
                FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
              ],
              onChanged: (value) {
                if (double.tryParse(value) == null) {
                  product.price = 0;
                } else {
                  product.price = double.parse(value);
                }
              },
              decoration: const InputDecoration(
                  labelText: 'Precio del producto',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(height: 30),
            SwitchListTile.adaptive(
                title: const Text('Disponible'),
                activeColor: Colors.indigo,
                value: product.available,
                onChanged: productForm.updateAvailability),
            SizedBox(height: 30),
            TextFormField(
              maxLines: 5,
              initialValue: product.description,
              onChanged: (value) => product.description = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La descripción es obligatoria';
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: 'Descripcion del producto',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ],
        ),
      ),
    );
  }
}
