import 'package:flutter/material.dart';

import '../../../providers/ciudades.dart';

class ListSearch extends StatefulWidget {
  ListSearch({Key? key}) : super(key: key);

  @override
  State<ListSearch> createState() => _ListSearchState();
}

class _ListSearchState extends State<ListSearch> {
  @override
  void initState() {
    _service = CiudadesService();
   
  }

  @override
  void dispose() {
    print('se destruye lista');
    _service.dispose();
    controller.dispose();
    super.dispose();
  }

  late CiudadesService _service;

  String? param;
  List<String> ciudades = [];
  bool isLoad = true;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: _service.ciudades,
          initialData: const [],
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (snapshot.connectionState == ConnectionState.active &&
                snapshot.data!.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: controller,
                          onChanged: (value) {
                            _service.filtrarCiudad(controller.text);
                          },
                          decoration: InputDecoration(
                              label: Text('Escribe el nombre de la ciudad')),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: (() => setState(() {})),
                          icon: Icon(Icons.search),
                        )
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pop(snapshot.data![index]);
                            },
                            child: ListTile(
                              title: Text(snapshot.data![index]),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.active &&
                snapshot.data!.isEmpty) {
              return Center(
                child: Text('Sin ciudades aún'),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
