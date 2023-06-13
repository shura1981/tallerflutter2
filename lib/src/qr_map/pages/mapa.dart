import 'package:flutter/material.dart';

import '../model/scandmodel.dart';

class MapScreen extends StatelessWidget {
  final ScanModel qr;
  const MapScreen({Key? key, required this.qr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MapScreen'),
      ),
      body: Center(
        child: Text(qr.valor),
      ),
    );
  }
}
