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
  ];
}
