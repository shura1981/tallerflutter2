import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
        elevation: 5.2,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _mostrarAlert(context),
          child: Text('Mostrar alerta'),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent, shape: StadiumBorder()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    final dialog = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Text('App de prueba'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Text('Este es el contenido de la caja de alerta'),
          FlutterLogo(size: 50.0)
        ],
      ),
      actions: [
        TextButton(
          child: Text('Cerrar'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text('Ok'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    final cupertinoDialog = CupertinoAlertDialog(
      title: Text('Título'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('Este es el contenido de la alerta'),
          SizedBox(
            height: 10,
          ),
          FlutterLogo(
            size: 100,
          )
        ],
        ),
          actions: [
        TextButton(
          child: Text('Cerrar'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text('Ok'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return   Platform.isIOS ? cupertinoDialog :  dialog;
        });
  }
}
