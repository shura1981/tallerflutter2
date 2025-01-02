import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _SingleCard(
            icon: Icons.abc_sharp,
            colorIcon: Colors.yellow,
            tap: () => print('MAIN'),
          ),
          _SingleCard(
            icon: Icons.find_in_page,
            colorIcon: Colors.yellow,
          )
        ]),
        TableRow(children: [
          _SingleCard(
            icon: Icons.abc_sharp,
            colorIcon: Colors.yellow,
            tap: () => print('MAIN'),
          ),
          _SingleCard(
            icon: Icons.find_in_page,
            colorIcon: Colors.yellow,
          )
        ]),
        TableRow(children: [
          _SingleCard(
            icon: Icons.abc_sharp,
            colorIcon: Colors.yellow,
            tap: () => print('MAIN'),
          ),
          _SingleCard(
            icon: Icons.find_in_page,
            colorIcon: Colors.yellow,
          )
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  _SingleCard({Key? key, required this.colorIcon, required this.icon, this.tap})
      : super(key: key);
  IconData icon;
  Color colorIcon;
  Function()? tap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(62, 66, 107, 0.653),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: tap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        icon,
                        color: Color.fromRGBO(62, 66, 107, 1),
                        size: 40,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: const [Colors.red, Colors.orange],
                          )),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'General',
                      style: TextStyle(color: colorIcon, fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ShaderMask(
//   shaderCallback: (Rect bounds) {
//     return LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [Colors.red, Colors.orange],
//     ).createShader(bounds);
//   },
//   child: Icon(
//     Icons.favorite,
//     color: Colors.white,
//     size: 60.0,
//   ),
// )