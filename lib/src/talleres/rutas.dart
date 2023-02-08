import 'package:flutter/material.dart';
import 'package:taller2/src/talleres/pages/pages.dart';

import '../models/menu_router.dart';

class TalleresAppRoute {
  static final menuOptions = <MenuRouter>[
    MenuRouter(
        route: '',
        icon: Icons.done_all_outlined,
        name: 'todoList',
        screen: TodoListApp()),
    MenuRouter(
        route: '',
        icon: Icons.list,
        name: 'Filtro de lista',
        screen: SelectList()),
    MenuRouter(route: '', icon: Icons.store, name: 'Sqlite', screen: AppDb()),
    MenuRouter(
        route: '',
        icon: Icons.add_box_outlined,
        name: 'Stack container',
        screen: StackScreen()),
            MenuRouter(
        route: '',
        icon: Icons.view_column,
        name: 'Column container',
        screen: ColumnScreen()),
                    MenuRouter(
        route: '',
        icon: Icons.navigate_before_outlined,
        name: 'Layout 1',
        screen: Layout1Screen()),
            MenuRouter(
        route: '',
        icon: Icons.view_column,
        name: 'Column container',
        screen: ColumnScreen()),
                    MenuRouter(
        route: '',
        icon: Icons.window,
        name: 'Media Query',
        screen: MediaQueryScreen()),
                       MenuRouter(
        route: '',
        icon: Icons.window,
        name: 'Layout Builder',
        screen: LayoutBuilderScreen()),
  ];
}
