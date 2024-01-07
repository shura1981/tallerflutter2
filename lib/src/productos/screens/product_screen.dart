import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:taller2/src/productos/providers/product_form_provider.dart';
import 'package:taller2/src/productos/services/camara_service.dart';
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

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return const AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: Center(
              child: CircularProgressIndicator(),
            ));
      },
    );
  }

  _updateImage(BuildContext context, String value) {
    productService.updateImage(value).then((value) {
      productService.updateImageSelectedProduct(value);
    }).catchError((onError) {
      _mostrarAlerta(context, 'Error', 'No se pudo subir la imagen');
    });
  }

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: false, //para que la appbar no se vea
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Nuevo Producto'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.grid_view,
            ),
            onPressed: () {
              CamaraService.getImgDevice(ImageSource.gallery).then((value) {
                _updateImage(context, value);
              }).catchError((onError) {
                _mostrarAlerta(
                    context, 'Error', 'No se pudo obtener la imagen');
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.camera_alt_outlined,
            ),
            onPressed: () {
              CamaraService.getImgDevice(ImageSource.camera).then((value) {
                _updateImage(context, value);
              }).catchError((onError) {
                _mostrarAlerta(
                    context, 'Error', 'No se pudo obtener la imagen');
              });
            },
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
        onPressed: () {
          FocusScope.of(context).unfocus();
          if (productForm.isValidForm()) {
            _showMyDialog(context);
            productService
                .createProductOrUpdate(productForm.product)
                .then((value) {
              Navigator.of(context).pop();
              _mostrarAlerta(context, 'Exito', 'Producto creado correctamente');
            }).catchError((onError) {
              Navigator.of(context).pop();
              _mostrarAlerta(context, 'Error', 'No se pudo crear el producto');
            });
          } else {
            _mostrarAlerta(
                context, 'Error', 'Por favor rellene todos los campos');
          }
        },
        child: const Icon(Icons.save_outlined),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context, String s, String t) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(s),
            content: Text(t),
            actions: [
              MaterialButton(
                  child: Text('Ok'),
                  elevation: 5,
                  textColor: Colors.blue,
                  onPressed: () => Navigator.pop(context))
            ],
          );
        });
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
        key: productForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
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
