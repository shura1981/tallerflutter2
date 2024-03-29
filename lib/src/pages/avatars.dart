import 'package:flutter/material.dart';

class Avatars extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('app bar'), actions:  [
        Container(
          margin: EdgeInsets.only(right: 5),
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 188, 24, 119),
            child: Text('SR', style: TextStyle(color: Colors.white),),
          ),
        )
      ]),
      body: Container(
        child: Center(
          child: CircleAvatar(
            maxRadius: 150,
            foregroundColor: Colors.black,
            backgroundImage: NetworkImage(
                'https://lh3.googleusercontent.com/a-/AOh14GjR7gEsaI7P2twKde42cKHh3FJrb865iCesZPz8'),
          ),
        ),
      ),
    );
  }
}
