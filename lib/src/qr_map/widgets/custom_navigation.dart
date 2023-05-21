import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller2/src/models/tab_qr_map.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<Ui>(context, listen: false);
    return BottomNavigationBar(
      onTap: (int i) => uiProvider.index = i,
      selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: uiProvider.index,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.qr_code,
            color: Theme.of(context).primaryColor,
          ),
          label: 'Qr',

        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.map,
            color: Theme.of(context).primaryColor,
          ),
          label: 'Map',
        ),
      ],
    );
  }
}
