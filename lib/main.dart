import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'src/models/heroes.dart';
// import 'src/models/slider_provider.dart';
// import 'src/models/themechanger.dart';
// import 'src/models/villanos.dart';
import 'src/models/models.dart';
import 'src/routes/index.dart';
import 'theme/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HeroresInfo()),
        ChangeNotifierProvider(create: (context) => VillanosInfo()),
        ChangeNotifierProvider(
            create: (context) => ThemeChanger(AppTheme.lightTheme)),
        ChangeNotifierProvider(create: (context) => SliderProvider()),
      ],
      child: MaterialAppWithTheme(),
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
        theme: _theme.getTheme(),
        darkTheme: AppTheme.darkTheme,
        title: 'Componentes App',
        initialRoute: AppRoute.initialRoute,
        routes: AppRoute.getRoutes(),
        onGenerateRoute: AppRoute.onGenerateRoute);
  }
}
