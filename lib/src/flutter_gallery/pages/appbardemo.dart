// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class AppBarDemo extends StatelessWidget {
  const AppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {},
        // ),
        title: Text(
          'localization.1',
        ),
        actions: [
          IconButton(
            tooltip: 'localization.2',
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'localization3',
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
          PopupMenuButton<Text>(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text(
                   ' localization 1',
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    'localization 2',
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    'localization 3',
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          'localization.cupertinoTabBarHomeTab',
        ),
      ),
    );
  }
}

