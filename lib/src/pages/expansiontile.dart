import 'package:flutter/material.dart';

class MyExpansionTile extends StatelessWidget {
  const MyExpansionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expansion Tile')),
      body:  ExpansionTile(
          title: const Text(
            'Animals',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          children: [
            ListTile(
              onLongPress: () => print("option"),
              title: const Text(
                'Dog',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
                onLongPress: () => print("option"),
              title: const Text(
                'Dog2',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const ListTile(
              title: Text(
                'Dog3',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const ListTile(
              title: Text(
                'Dog4',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ]),
    );
  }
}
