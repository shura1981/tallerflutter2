import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller2/src/models/tab_qr_map.dart';

import '../../providers/db_provider.dart';
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
    final uiProvider = Provider.of<Ui>(context);
    final currentIndex = uiProvider.index;
    DBProvider.db.database;

    final scandModel =
        ScanModel(id: 1, tipo: 'http', valor: 'https://nutramerican.com');
    DBProvider.db.nuevoScand(scandModel).then((value) => print(value));

    switch (currentIndex) {
      case 0:
        return MapScreen();
      default:
        return QRScreen();
    }
  }
}
