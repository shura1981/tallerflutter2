import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? url;
  final File? newPitureFile;
  const ProductImage({super.key, this.url, this.newPitureFile});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildBoxDecoration(),
      width: double.infinity,
      height: 300,
      child: ClipRRect(
        // borderRadius: const BorderRadius.only(
        //     topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        child: _getImage(),
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

  _getImage() {
    if (newPitureFile != null) {
      return Image.file(
        newPitureFile!,
        fit: BoxFit.cover,
      );
    }

    if (url!.startsWith('http')) {
      return FadeInImage(
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(url!));
    }
    
    return const Image(
      image: AssetImage('assets/no-image.png'),
      fit: BoxFit.cover,
    );
  }
}
