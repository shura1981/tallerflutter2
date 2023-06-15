import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller2/src/models/qr.dart';
import 'package:taller2/src/qr_map/widgets/widgets.dart';

import '../../providers/scan_list_provider.dart';
import '../../utils/keyvaluesfromstring.dart';
import '../../utils/launcher.dart';
import '../model/scandmodel.dart';
import '../pages/mapa.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        // showBottomModal(context);
        _scand(context);
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}

Future<void> _showMyDialog(context, QR value) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('El número de factura es ${value.numFac}'),
              Text(value.cufe),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {},
          ),
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showBottomModal(
  BuildContext contextCode,
) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: contextCode,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
            heightFactor: 1,
            child: ScanCodeWidget(
              onTap: (code) async {
                // final input = code;
                // print('input: $input');
                // Map<String, String> keyValueMap = createMapFromString(input);
                // final keyValueModel = QR.fromMap(keyValueMap);
                // print('NumFac: ${keyValueModel.numFac}');
                // print('NitFac: ${keyValueModel.nitFac}');
                // print('DocAdq: ${keyValueModel.docAdq}');
                // print('FecFac: ${keyValueModel.fecFac}');
                // print('ValFac: ${keyValueModel.valFac}');
                // _showMyDialog(context, keyValueModel);
                _scand(context, code);
              },
            ));
      });
}

Future<void> _scand(BuildContext context,
    [code = 'geo:3.5324642364190586,-76.29573287273763']) async {
  final input = code;

  final scanListProvider =
      Provider.of<ScanListProvider>(context, listen: false);
  final model = await scanListProvider
      .nuevoScand(ScanModel(valor: input, tipo: 'geo', id: 1));

  if (model.tipo == 'http') {
    launch(model.valor);
  } else {
    final route = MaterialPageRoute(
        builder: (context) => MapScreen(
              qr: model,
            ));
    Navigator.push(context, route);
  }
}
