import 'package:flutter/material.dart';
class ScanButton extends StatelessWidget {
  const ScanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
