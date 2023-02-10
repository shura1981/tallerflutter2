import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../providers/database.dart';

class Alimentos extends StatefulWidget {
  @override
  _AlimentosState createState() => _AlimentosState();
}

class _AlimentosState extends State<Alimentos> {
  @override
  void initState() {
    // TODO: implement initState
    editingController.addListener(() {setState(() { });});
    super.initState();
  }

  final _db = Data();
  @override
  void dispose() {
    // TODO: implement dispose
    _db.dispose();
    editingController.dispose();
    _focus.dispose();
    super.dispose();
  }
   TextEditingController editingController = TextEditingController();
    final FocusNode _focus = FocusNode();
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        title: Text('Base de datos de alimentos'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                _db.find(value);
              },
              focusNode: _focus,
              controller: editingController,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Color.fromARGB(255, 197, 197, 197),
                  filled: true,
                  // labelText: 'Buscar',
                  hintText: 'Buscar',
                  suffixIcon: editingController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            editingController.clear();
                            _focus.unfocus();
                          },
                          icon: Icon(
                            Icons.clear,
                            color: Colors.white,
                          ))
                      : null,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)))),
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: _db.alimentos,
                builder: (context, AsyncSnapshot<List<Map>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                      ),
                    );
                  } else {
                    return Materiales(snapshot.data);
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class Materiales extends StatelessWidget {
  const Materiales(this.alimentos);
  final List<Map>? alimentos;
  @override
  Widget build(BuildContext context) {
    if (alimentos!.isEmpty) {
      return const Center(
        child: Text(
          'Error de conexión, no hay datos disponibles',
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(color: Colors.grey),
        itemCount: alimentos!.length,
        itemBuilder: (_, i) {
          final bodega = alimentos![i];
          return ListTile(
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Theme.of(context).primaryColor),
            onTap: () {
              //  Platform.isAndroid ? showAndroid(context) : showIos(context);
              show(context, bodega);
              print(bodega.toString());
            },
            title: Text(bodega['alimentos'],
                style: TextStyle(color: Theme.of(context).primaryColor)),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Clasificación: ${bodega['clasificación']} ',
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  void show(context, item) {
    double espacio = 10;
    String medida = item['unidad_medida'].toString().isEmpty
        ? 'porción'
        : item['unidad_medida'];
    if (item['cantidad'] == 1 &&
        (item['unidad_medida'].toString().contains('gramos') ||
            item['unidad_medida'].toString().contains('Gramos')))
      medida = 'gramo';
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text(item['alimentos']),
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Cantidad',
                      textAlign: TextAlign.left,
                    )),
                    Expanded(
                        child: Text(
                      '${item['cantidad']}',
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
                SizedBox(height: espacio),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Unidad de medida',
                      textAlign: TextAlign.left,
                    )),
                    Expanded(
                        child: Text(
                      medida,
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
                SizedBox(
                  height: espacio + 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Proteína',
                      textAlign: TextAlign.left,
                    )),
                    Expanded(
                        child: Text(
                      '${item['proteina']} g',
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
                SizedBox(
                  height: espacio,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Carbohidratos',
                      textAlign: TextAlign.left,
                    )),
                    Expanded(
                        child: Text(
                      '${item['chos']} g',
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
                SizedBox(
                  height: espacio,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Grasa',
                      textAlign: TextAlign.left,
                    )),
                    Expanded(
                        child: Text(
                      '${item['grasa']} g',
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
                SizedBox(
                  height: espacio,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Calorías',
                      textAlign: TextAlign.left,
                    )),
                    Expanded(
                        child: Text(
                      '${item['calorias']}',
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
              ]),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Aceptar')),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar'))
              ]);
        });
  }

  void showAndroid(context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text('Android'),
              content: Column(mainAxisSize: MainAxisSize.min, children: const [
                Text('este el el contenido'),
                SizedBox(height: 10),
                FlutterLogo(size: 100)
              ]),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Aceptar')),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar'))
              ]);
        });
  }

  void showIos(context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
              title: Text('Ios'),
              content: Column(mainAxisSize: MainAxisSize.min, children: const [
                Text('este el el contenido'),
                SizedBox(height: 10),
                FlutterLogo(size: 100)
              ]),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Aceptar')),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar'))
              ]);
        });
  }
}
