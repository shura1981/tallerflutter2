
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:taller2/src/models/tab_qr_map.dart';
import 'package:taller2/src/productos/providers/Notification_messenger_service.dart';
import 'package:taller2/src/productos/providers/login_form_provider.dart';
import 'package:taller2/src/productos/services/product_service.dart';

// import 'src/models/heroes.dart';
// import 'src/models/slider_provider.dart';
// import 'src/models/themechanger.dart';
// import 'src/models/villanos.dart';
import 'src/models/models.dart';
import 'src/providers/scan_list_provider.dart';
import 'src/routes/index.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations(
// [
// DeviceOrientation.portraitUp,
// DeviceOrientation.portraitDown
// ]
// );
  // registreLicence();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final query= MediaQuery.of(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HeroresInfo()),
        ChangeNotifierProvider(create: (context) => VillanosInfo()),
        ChangeNotifierProvider(
            create: (context) => ThemeChanger(AppTheme.lightTheme)),
        ChangeNotifierProvider(create: (context) => SliderProvider()),
        ChangeNotifierProvider(create: (context) => Ui()),
        ChangeNotifierProvider(create: (context) => ScanListProvider()),
        ChangeNotifierProvider(create: (context) => ProducService()),
        ChangeNotifierProvider(create: (context) => LoginFormProvider()),
      ],
      child: MediaQuery(
        data: query.copyWith(textScaleFactor: query.textScaleFactor.clamp(0.8, 1.2)), //para que no se vea tan grande cuando se cambia el tamaño de la letra o el tamaño de la pantalla
        child: MaterialAppWithTheme()),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: NotificationMessengerService.messengerKey,
        theme: _theme.getTheme(),
        darkTheme: AppTheme.darkTheme,
        title: 'Componentes App',
        initialRoute: AppRoute.initialRoute,
        routes: AppRoute.getRoutes(),
        onGenerateRoute: AppRoute.onGenerateRoute);
  }
}



registreLicence() {
  return LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/Lato/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}
