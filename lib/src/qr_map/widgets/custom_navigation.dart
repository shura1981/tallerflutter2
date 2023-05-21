import 'package:flutter/material.dart';
class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: 0,
      items:  [
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code, color:Theme.of(context).primaryColor, ),
          label: 'Qr',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map, color:Theme.of(context).primaryColor, ),
          label: 'Map',
        ),
      ],
    );
  }
}
