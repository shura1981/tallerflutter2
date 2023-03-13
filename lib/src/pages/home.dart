import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller2/src/providers/menu_provider.dart';
import 'package:taller2/src/utils/parseIcons.dart';

import '../../theme/app_theme.dart';
import '../models/themechanger.dart';
import '../routes/index.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _state = false;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
        actions: [
          Switch(
            value: _state,
            onChanged: (bool value) {
              setState(() {
                _state = value;
                if (_state) {
                  theme.setTheme(AppTheme.darkTheme);
                } else {
                  theme.setTheme(AppTheme.lightTheme);
                }
                print(value);
              });
            },
            activeColor: Color(0xFF6200EE),
          )
        ],
      ),
      body: _optionsMenus(context),
    );
  }

  Widget _optionsMenus(context) {
    List<Widget> menus = [];
    for (final item in AppRoute.menuOptions) {
      menus.add(Column(
        children: [
          ListTile(
            title: Text(item.name),
            leading: Icon(item.icon, color: Theme.of(context).primaryColor),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              print(item.route);
              Navigator.pushNamed(context, item.route, arguments: 'hola');
            },
          ),
          Divider()
        ],
      ));
    }
    return ListView(
      children: menus,
    );
  }

  Widget _listMenu() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot snapshot) {
        return ListView(
          children: _options(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _options(List<dynamic> data, context) {
    List<Widget> menus = [];
    for (var item in data) {
      menus.add(Column(
        children: [
          ListTile(
            title: Text(item['texto']),
            leading: getIcon(item['icon']),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.blueAccent,
            ),
            onTap: () {
              print(item['ruta']);
              Navigator.pushNamed(context, item['ruta'], arguments: 'hola');
            },
          ),
          Divider()
        ],
      ));
    }
    return menus;
  }
}
