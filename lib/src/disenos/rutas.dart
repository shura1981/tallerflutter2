import 'package:flutter/material.dart';
import 'package:taller_flutter/src/disenos/pages/pages.dart';

import '../models/menu_router.dart';

class DisenosAppRoute {
  static final menuOptions = <MenuRouter>[
    MenuRouter(
        route: '',
        icon: Icons.done_all_outlined,
        name: 'básico',
        screen: BasicScreen()),
    MenuRouter(
        route: '',
        icon: Icons.screen_lock_landscape,
        name: 'scroll',
        screen: ScrollScreen()),
    MenuRouter(
        route: '',
        icon: Icons.color_lens,
        name: 'avanzado',
        screen: AvanceScreen()),
  ];
}
