// ignore: constant_identifier_names
import 'dart:async';

const List<String> PRODUCTOS = ['Micrófono', 'Parlante', 'Teclado', 'Cámara'];

class ProductosBlock {
  Stream<List<String>> get getProductos async* {
    final List<String> productos = [];
    for (String producto in PRODUCTOS) {
      await Future.delayed(Duration(seconds: 2));
      productos.add(producto);
      yield productos;
    }
  }

final StreamController<int> _productosContador= new StreamController<int>();
Stream<int> get productosContador=> _productosContador.stream;

ProductosBlock(){
  getProductos.listen((productosList){
    if (!_productosContador.isClosed) {
      _productosContador.add(productosList.length);
    }});
}

dispose(){
  _productosContador.close();
}

}
