import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);
  final style = const TextStyle(color: Color.fromARGB(255, 247, 245, 245));
  final styleSmall =
      const TextStyle(color: Color.fromARGB(255, 237, 236, 236), fontSize: 10);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Theme.of(context).primaryColor,
        child: ListView(
          children: [
            InkWell(
              splashColor: const Color.fromARGB(255, 211, 211, 211),
              onTap: (() => print("tap")),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 62,
                    backgroundColor: const Color.fromARGB(255, 209, 209, 209),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: Image.network(
                        "https://e.rpp-noticias.io/normal/2018/01/03/414441_546114.jpg",
                        fit: BoxFit.cover,
                      ).image,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Steven realpe",
                    style: style,
                  ),
                  Text(
                    "Developer",
                    style: styleSmall,
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            ),
            MenuItem(
              color: const Color.fromARGB(255, 255, 255, 255),
              icon: Icons.input_outlined,
              text: "TextFilds",
              onPressed: () => _go(context, 'textfields'),
            ),
            MenuItem(
              color: const Color.fromARGB(255, 255, 255, 255),
              icon: Icons.access_alarms,
              text: "Streams",
              onPressed: () => _go(context, 'stream'),
            ),
            MenuItem(
              color: const Color.fromARGB(255, 255, 255, 255),
              icon: Icons.card_giftcard_rounded,
              text: "BottomSheet",
              onPressed: () => _go(context, 'bottomsheet'),
            ),
            MenuItem(
              color: const Color.fromARGB(255, 255, 255, 255),
              icon: Icons.navigation,
              text: "Navigation Bar",
              onPressed: () => _go(context, 'barnav'),
            ),
            MenuItem(
              color: const Color.fromARGB(255, 255, 255, 255),
              icon: Icons.compass_calibration_outlined,
              text: "Expansion Tile",
              onPressed: () {
                _go(context, 'expansiontitle');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            MenuItem(
              color: const Color.fromARGB(255, 255, 255, 255),
              icon: Icons.list_alt_outlined,
              text: "Infinity Scroll",
              onPressed: () {
                _go(context, 'infinitys');
              },
            ),
            MenuItem(
              color: const Color.fromARGB(255, 255, 255, 255),
              icon: Icons.settings_accessibility_outlined,
              text: "Preferencias",
              onPressed: () {
                _go(context, 'preferences');
              },
            ),
            MenuItem(
              color: const Color.fromARGB(255, 255, 255, 255),
              icon: Icons.screen_lock_landscape_outlined,
              text: "Media Query Orientation",
              onPressed: () {
                   _go(context, 'mediaquery1');
              },
            ),
            MenuItem(
              color: Colors.blue,
              icon: Icons.access_alarms,
              text: "Streams",
              onPressed: () {},
            ),
            MenuItem(
              color: Colors.blue,
              icon: Icons.access_alarms,
              text: "Streams",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  void _go(BuildContext context, String s) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(s);
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem(
      {Key? key,
      required this.icon,
      required this.color,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Colors.white,
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      onTap: onPressed,
    );
  }
}
