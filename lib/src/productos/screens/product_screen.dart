import 'package:flutter/material.dart';
import 'package:taller2/src/productos/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, //para que la appbar no se vea
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        child: Column(
          children: const [
            Stack(
              children: [ProductImage()],
            ),
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
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Nombre del producto',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(height: 30),
            TextFormField(
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
                value: true,
                onChanged: (value) {}),
            SizedBox(height: 30),
            TextFormField(
              maxLines: 5,
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
