import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? url;
  const ProductImage({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildBoxDecoration(),
      width: double.infinity,
      height: 300,
      child: ClipRRect(
        // borderRadius: const BorderRadius.only(
        //     topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        child: url == null
            ? const Image(
                image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              )
            : FadeInImage(
                fit: BoxFit.contain,
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(url!)),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 7))
        ],
        // borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(45), topRight: Radius.circular(45)),
      );
}
