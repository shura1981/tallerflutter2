import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../providers/scan_list_provider.dart';
import '../../utils/launcher.dart';
import '../pages/mapa.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;
  const ScanTiles({Key? key, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scandListProvider = Provider.of<ScanListProvider>(context);
    final scans = scandListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .deleteScand(scans[i].id);
        },
        child: ListTile(
          leading: Icon(
              tipo == 'http' ? Icons.home_max_outlined : Icons.map_outlined,
              color: Theme.of(context).primaryColor),
          title: Text(scans[i].valor),
          subtitle: Text('ID: ${scans[i].id}'),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () {
            if (scans[i].tipo == 'http') {
              launch(scans[i].valor);
            } else {
              // final route = MaterialPageRoute(
              //         builder: (context) => MapScreen(
              //               qr: scans[i],
              //             ));
              //     Navigator.push(context, route);
            }
          }
        ),
      ),
    );
  }


}


