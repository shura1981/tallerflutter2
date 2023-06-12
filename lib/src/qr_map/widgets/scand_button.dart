import 'package:flutter/material.dart';
import 'package:taller2/src/models/qr.dart';
import 'package:taller2/src/qr_map/widgets/widgets.dart';

import '../../utils/keyvaluesfromstring.dart';
class ScanButton extends StatelessWidget {
  const ScanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        // Navigator.pop(context);
         showBottomModal(context);
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
              onTap: (code) {
                Navigator.of(contextCode).pop();
                final input = code;
                Map<String, String> keyValueMap = createMapFromString(input);
                final keyValueModel = QR.fromMap(keyValueMap);
                print('NumFac: ${keyValueModel.numFac}');
                print('NitFac: ${keyValueModel.nitFac}');
                print('DocAdq: ${keyValueModel.docAdq}');
                print('FecFac: ${keyValueModel.fecFac}');
                print('ValFac: ${keyValueModel.valFac}');
                _showMyDialog(context, keyValueModel);
              },
            ));
      });
}
