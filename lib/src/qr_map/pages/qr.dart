import 'package:flutter/material.dart';
import '../../models/qr.dart';
import '../../utils/keyvaluesfromstring.dart';
import '../widgets/widgets.dart';

class QRScreen extends StatelessWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () {
          showBottomModal(context);
        },
        icon: Icon(Icons.open_in_browser),
        label: Text('Escanear'),
      ),
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
