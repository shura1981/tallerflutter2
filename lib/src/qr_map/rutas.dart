import 'package:flutter/material.dart';
import 'package:taller_flutter/src/qr_map/pages/pages.dart';

import '../models/menu_router.dart';

class QrMapAppRoute {
  static final menuOptions = <MenuRouter>[
    MenuRouter(
        route: '',
        icon: Icons.qr_code_2_rounded,
        name: 'Qr',
        screen: QRScreen()),
  ];
}
