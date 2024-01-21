import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_flutter/src/models/tab_qr_map.dart';

import '../../providers/scan_list_provider.dart';
import '../widgets/custom_navigation.dart';
import '../widgets/scan_tiles.dart';
import '../widgets/scand_button.dart';

class QRMapScreen extends StatelessWidget {
  const QRMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false)
                  .deleteScandAll();
            },
          )
        ],
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
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return ScanTiles(tipo: 'geo');
      default:
        scanListProvider.cargarScansPorTipo('http');
        return ScanTiles(tipo: 'http');
    }
  }
}
