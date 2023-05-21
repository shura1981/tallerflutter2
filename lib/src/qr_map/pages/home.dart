import 'package:flutter/material.dart';
import 'package:taller2/src/qr_map/pages/qr.dart';

import '../rutas.dart';
import '../widgets/custom_navigation.dart';
import '../widgets/scand_button.dart';
import 'pages.dart';

class QRMapScreen extends StatelessWidget {
  const QRMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú'),
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const currentIndex = 1;
    switch (currentIndex) {
      case 0:
        return MapScreen();
      default:
        return QRScreen();
    }
  }
}
