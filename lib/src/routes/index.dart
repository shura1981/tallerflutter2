import 'package:flutter/material.dart';


import '../disenos/pages/home.dart';
import '../flutter_gallery/pages/pages.dart';
import '../flutter_gallery/router.dart';
import '../models/menu_router.dart';
import '../pages/pages.dart';
import '../pages/streams.dart';
import '../qr_map/pages/home.dart';
import '../talleres/pages/pages.dart' show HomeTalleres;

class AppRoute{
static const initialRoute= '/';
static final menuOptions= < MenuRouter>[
MenuRouter(route: 'talleres', icon: Icons.list, name: 'Talleres', screen: HomeTalleres()),
MenuRouter(route: 'disenos', icon: Icons.picture_in_picture, name: 'diseños', screen: HomeDisenos()),
MenuRouter(route: 'alert', icon: Icons.add_alert, name: 'alert', screen: AlertPage()),
MenuRouter(route: 'qrmap', icon: Icons.qr_code, name: 'qr_map', screen: QRMapScreen()),
MenuRouter(route: 'avatar', icon: Icons.home, name: 'avatar', screen: Avatars()),
MenuRouter(route: 'card', icon: Icons.folder_open, name: 'card', screen: CardPage()),
MenuRouter(route: 'bloc', icon: Icons.accessibility, name: 'bloc', screen: Bloc()),
MenuRouter(route: 'provider', icon: Icons.desktop_access_disabled, name: 'provider', screen: ProviderScreen()),
MenuRouter(route: 'sqlite', icon: Icons.accessibility, name: 'sqlite', screen: Alimentos()),
MenuRouter(route: 'container', icon: Icons.account_box, name: 'container animation', screen: AnimatedScreen()),
MenuRouter(route: 'textinput', icon: Icons.input_rounded, name: 'Text field', screen: TextFieldScreen()),
MenuRouter(route: 'sliderscreen', icon: Icons.slideshow_outlined, name: 'slider and checkbock', screen: SliderScreen()),
MenuRouter(route: 'listviewbuilder', icon: Icons.list_alt_outlined, name: 'listview builder', screen: ListviewBuilder()),
MenuRouter(name: 'infinity Scroll', icon: Icons.window, screen: InfinityScroll(), route: 'infinityScroll'),
MenuRouter(route: 'grid', icon: Icons.grid_3x3_outlined, name: 'Grid view', screen: GridViewGallery()),
MenuRouter(route: 'imagepicker', icon: Icons.picture_in_picture, name: 'Image Picker', screen: PickerImage()),
MenuRouter(route: 'tabbar', icon: Icons.tab, name: 'Tab Bar', screen: TabBarScreen()),
MenuRouter(route: 'gallery', icon: Icons.browse_gallery_sharp, name: 'Gallery', screen: HomeGalleryScreen()),
MenuRouter(route: 'stream', icon: Icons.timelapse, name: 'Stream', screen: StreamScreen()),
];
static Route<dynamic>? onGenerateRoute(RouteSettings setting){
return MaterialPageRoute(builder: (context)=> AlertPage());
}

static Map<String, Widget Function(BuildContext)> getRoutes(){
 Map<String, Widget Function(BuildContext)> routes = {};
 routes.addAll({'/': (BuildContext build)=>HomePage()});
for(final item in menuOptions){
routes.addAll({item.route: (BuildContext build)=>item.screen});
}
return routes;
}


// static Map<String, WidgetBuilder> getAplicationRoutes(){
// return <String, WidgetBuilder>{
// '/'  : (BuildContext context) => HomePage(),
// 'alert' : (BuildContext context) => AlertPage(),
// 'avatar': (BuildContext context) => Avatars(),
// 'card': (BuildContext context) => CardPage(),
// 'bloc': (BuildContext context) => Bloc()
// };

// }


}