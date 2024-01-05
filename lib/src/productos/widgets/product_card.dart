import 'package:flutter/material.dart';
import 'package:taller2/src/productos/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 400,
        margin: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 50),
        decoration: _cardBorders(),
        child: Stack(
          children: [
            _BackgroundImage(product.picture),
            Align(
                alignment: Alignment.bottomLeft,
                child: _ProductDetails(name: product.name, id: product.id)),
            Align(
                alignment: Alignment.topRight, child: _PriceTag(product.price)),
            if (!product.available)
              Positioned(child: _NotAviable(), top: 0, left: 0)
          ],
        ));
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
        color: const Color.fromARGB(255, 253, 253, 253),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 5),
            blurRadius: 10,
          )
        ]);
  }
}

class _NotAviable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      alignment: Alignment.center,
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('No disponible',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final double price;

  const _PriceTag(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$$price',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String name;
  final String id;

  const _ProductDetails({required this.name, required this.id});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 65,
        decoration: _buildBoxDecoration(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'id: $id',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(BuildContext context) => BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}

class _BackgroundImage extends StatelessWidget {
  final String? image;

  const _BackgroundImage(this.image);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 400,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: image != null
              ? FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image:  NetworkImage(image!),
            fit: BoxFit.contain,
          ) : Image(
            image: AssetImage('assets/no-image.png'),
            fit: BoxFit.cover,
          )
        ));
  }
}
