import 'package:flutter/material.dart';

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
                //Navigator.of(contextCode).pop();
              },
            ));
      });
}
