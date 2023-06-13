import 'package:flutter/material.dart';
import 'package:taller2/src/flutter_gallery/pages/pages.dart';

import '../models/menu_router.dart';

class FlutterGalleryRoute {
  static final menuOptions = <MenuRouter>[
    MenuRouter(
        route: '',
        icon: Icons.browse_gallery_rounded,
        name: 'GALLERY',
        screen: Gallery1()),
        MenuRouter(
        route: '',
        icon: Icons.browse_gallery_rounded,
        name: 'APPBAR DEMO',
        screen: AppBarDemo()),
           MenuRouter(
        route: '',
        icon: Icons.browse_gallery_rounded,
        name: 'APPBAR DEMO',
        screen: BannerDemo()),
  ];
}
