import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taller2/src/providers/shared_preferences.dart';

import '../../providers/storage.dart';
import '../../providers/storagefile.dart';

class Todo {
  String what;
  bool done;

  Todo(this.what, [this.done = false]);

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(json['what'], json['done']);
  }

  Map<String, dynamic> toJson() => {'what': what, 'done': done};

  toogleDone() {
    done = !done;
  }
}

class TodoListApp extends StatefulWidget {
  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  List<Todo> _todos = [];
  bool isLoad = false;
  final storage = LocalStorage();
  final preferences = StorePreferences();
  final storageFile = StorageFile();
  @override
  void initState() {
    _getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List'), actions: [
        IconButton(
            onPressed: () {
              if (dondeCount == 0) return;
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('¿Deseas eliminar los items?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text('Aceptar'),
                      ),
                    ],
                  );
                },
              ).then(
                (value) {
                  print(value);
                  if (value != null && value != false) {
                    final deleteds = _deleteDone();
                    print(deleteds);

                    final snackBar = SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              _todos.addAll([...deleteds]);
                              setState(() {});

                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                            child: Text('Deshacer'),
                          ),
                          Text('¡Eliminado!')
                        ],
                      ),
                    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snackBar)
                        .closed
                        .then((SnackBarClosedReason reason) {
                      if (reason == SnackBarClosedReason.timeout) {
                        print("tiempo expirado");
                      }
                    });
                  }
                },
              );
            },
            icon: Icon((Icons.delete)))
      ]),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showMyDialog(context).then((value) {
              if (value == null || value.isEmpty) return;
              _todos.add(Todo(value));

              setState(() {});
            });
          },
          child: Icon(Icons.plus_one)),
    );
  }

  List<Todo> _deleteDone() {
    List<Todo> temp = _todos.where((element) => element.done == false).toList();
    List<Todo> deleted =
        _todos.where((element) => element.done == true).toList();
    _todos = temp;
    setState(() {});
    return deleted;
  }

  int get dondeCount => _todos.where((element) => element.done).length;
  Future pause(seconds) => Future.delayed(Duration(seconds: seconds));

  Future<List<Todo>> _readTodos() async {
    try {
      final load = await storageFile.getvalue();
      List<Todo> todos = [];
      if (load != null) {
        List json = jsonDecode(load);
        for (var item in json) {
          todos.add(Todo.fromJson(item));
        }
      } else {
        _writeTodos();
      }
      return todos;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Todo>> _readTodosFromStorage() async {
    try {
      final isExist = await storage.getValue('todo') ?? '';
      print('Existe $isExist');
      List<Todo> todos = [];
      if (isExist.isNotEmpty) {
        List json = jsonDecode(await storage.getValue('todo') as String);
        for (var item in json) {
          todos.add(Todo.fromJson(item));
        }
      } else {
        _writeTodosToStorage();
      }

      return todos;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Todo>> _readTodosFromPreferences() async {
    try {
      final isExist = await preferences.getValue('todo') ?? '';
      print('Existe $isExist');
      List<Todo> todos = [];
      if (isExist.isNotEmpty) {
        List json = jsonDecode(await storage.getValue('todo') as String);
        for (var item in json) {
          todos.add(Todo.fromJson(item));
        }
      } else {
        _writeTodosToPreferences();
      }

      return todos;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _writeTodos() async {
    try {
      String jsonText = jsonEncode(_todos);
     return await storageFile.write(jsonText);
    } catch (e) {
      return 'ocurrió un error: ' + e.toString();
    }
  }

  Future<String> _writeTodosToStorage() async {
    try {
      String jsonText = jsonEncode(_todos);
      await storage.write('todo', jsonText);
      return 'Guardado con éxito';
    } catch (e) {
      return 'ocurrió un error: ' + e.toString();
    }
  }

  Future<String> _writeTodosToPreferences() async {
    try {
      String jsonText = jsonEncode(_todos);
      await preferences.write('todo', jsonText);
      return 'Guardado con éxito';
    } catch (e) {
      return 'ocurrió un error: ' + e.toString();
    }
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    _writeTodos().then((value) => print(value)).catchError((e) => print(e));
    // _writeTodosToStorage()
    //     .then((value) => print(value))
    //     .catchError((e) => print(e));
    // _writeTodosToPreferences()
    //     .then((value) => print(value))
    //     .catchError((e) => print(e));
  }

  void _getTodos() async {
    try {
      isLoad = true;
      super.setState(() {});
      _todos = await _readTodos();
      // _todos = await _readTodosFromStorage();
      // _todos = await _readTodosFromPreferences();
    } catch (e) {
      print(e);
    } finally {
      isLoad = false;
      super.setState(() {});
    }
  }

  Widget _buildList() {
    if (isLoad) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_todos.isEmpty) {
      return const Center(
        child: Text('La lista está vacía'),
      );
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        Todo item = _todos[index];
        return ListTile(
          onTap: () {
            item.toogleDone();
            setState(() {});
          },
          leading: Checkbox(
            value: item.done,
            onChanged: (bool? value) {
              item.done = value!;
              setState(() {});
            },
          ),
          title: Text(
            item.what,
            style: TextStyle(
                decoration: item.done
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
        );
      },
      itemCount: _todos.length,
    );
  }
}

Future<String?> _showMyDialog(context) async {
  String response = '';
  return showDialog<String>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                decoration:
                    InputDecoration(label: Text('Nombre de la nueva tarea')),
                onSubmitted: (value) => Navigator.of(context).pop(value),
                onChanged: (value) => response = value,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(null);
            },
          ),
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop(response);
            },
          ),
        ],
      );
    },
  );
}
