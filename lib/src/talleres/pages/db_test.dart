import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// WidgetsFlutterBinding.ensureInitialized();

class AppDb extends StatefulWidget {
  AppDb({Key? key}) : super(key: key);

  @override
  State<AppDb> createState() => _AppDbState();
}

class _AppDbState extends State<AppDb> {
  late HelperDb _helperDb;
  List<Dog> delete = [];
  @override
  initState() {
    _helperDb = HelperDb();
    _helperDb.dogs('').then((value) => _helperDb.controller.add(value));
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _helperDb.closeDb();
    _helperDb.controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test db')),
      body: StreamBuilder<List<Dog>>(
          stream: _helperDb.controller.stream,
          builder: (context, AsyncSnapshot<List<Dog>> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return Center(child: Text('Vacio'));
              } else {
                final item = snapshot.data;
                return ListDogs(
                  item: item,
                  onTapDog: (value) {
                    print(value);
                    _helperDb.updateDog(value).then((value) =>  _helperDb.dogs('').then((value) => _helperDb.controller.add(value)));
                  },
                  onTapDeleteDog: (Dog dog) {
                    delete.add(dog);
                    _helperDb.deleteDog(dog.id).then((value) {
                      ScaffoldMessenger.of(context)
                        ..clearSnackBars()
                        ..showSnackBar(SnackBar(
                            content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () async {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  for (var dog in delete) {
                                    await _helperDb.insertDog(dog);
                                  }
                                  setState(() {});
                                },
                                child: Text('Deshacer')),
                            Text('¡Item eliminado!'),
                          ],
                        ))).closed.then((value) => delete.remove(dog));
                    });
                  },
                );
              }
            }
            return Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            Navigator.push<Dog>(
              context,
              MaterialPageRoute<Dog>(
                builder: (BuildContext context) =>
                    FullScreenDialogDog(null), // fullscreenDialog: true,
              ),
            ).then((dog) {
              if (dog == null) return;
              _helperDb.insertDog(dog).then((value) {
                print('Insertado'+dog.toString());
                // setState(() {});
                  _helperDb.dogs('').then((value) => _helperDb.controller.add(value));
                ScaffoldMessenger.of(context)
                  ..clearSnackBars()
                  ..showSnackBar(SnackBar(
                      content: Row(
                    children: const [
                      Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('¡Insertado!'),
                    ],
                  )));
              });
            });
          },
          child: Icon(Icons.add)),
    );
  }
}

class ListDogs extends StatelessWidget {
  const ListDogs(
      {Key? key,
      required this.item,
      required this.onTapDog,
      required this.onTapDeleteDog})
      : super(key: key);

  final List<Dog>? item;
  final Function onTapDog;
  final Function onTapDeleteDog;
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
          itemBuilder: (context, index) {
            final dog = item![index];
            print(item!.length);
            return Dismissible(
              onDismissed: (direction) {
                onTapDeleteDog(dog);
              },
              key: UniqueKey(),
              background: deleteBgItem(),
              child: ListTile(
                onTap: () {
                  Navigator.push<Dog>(
                    context,
                    MaterialPageRoute<Dog>(
                      builder: (BuildContext context) =>
                          FullScreenDialogDog(dog), // fullscreenDialog: true,
                    ),
                  ).then((value) {
                    if (value == null) return;
                    onTapDog(value);
                  });
                },
                title: Text(dog.name),
                subtitle: Text('Age ${dog.age}'),
                trailing: Text('id ${dog.id}'),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: item!.length),
    );
  }

  Widget deleteBgItem() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}

class FullScreenDialogDog extends StatefulWidget {
  @override
  State<FullScreenDialogDog> createState() => _FullScreenDialogDogState();

  FullScreenDialogDog(this.item);
  Dog? item;
}

class _FullScreenDialogDogState extends State<FullScreenDialogDog> {
  late FocusNode myFocusNode;
  final dogMap = <String, dynamic>{'id': 0, 'name': '', 'age': 0};
  int i = 0;
  String? validatorName(value) {
    if (value == null) {
      return 'Campo requerido';
    }
    if (value.length < 3) {
      return 'El nombre debe tener Mínimo 3 caracteres';
    }
    return null;
  }

  String? validator(value) {
    if (value == null || value.length < 1) {
      return 'Campo requerido';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      dogMap['id'] = widget.item!.id;
      dogMap['name'] = widget.item!.name;
      dogMap['age'] = widget.item!.age;
    }
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myFormKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop(null);
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color(0xFF6200EE),
        // title: const Text('Crate New Dog', textAlign: TextAlign.center),
        actions: [
          TextButton(
              onPressed: () {
                if (!myFormKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                    ..clearSnackBars()
                    ..showSnackBar(SnackBar(
                        content: Row(
                      children: const [
                        Icon(
                          Icons.error,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Por favor ingresa los datos'),
                      ],
                    )));
                  return;
                }
                var intValue = Random().nextInt(1000);
                FocusScope.of(context).requestFocus(FocusNode());

                if (dogMap['id'] == 0) {
                  dogMap['id'] = intValue;
                }
                Navigator.of(context).pop(Dog.fromMap(dogMap));
              },
              child: const Text(
                'Guardar',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: myFormKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  initialValue: dogMap['name'],
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onEditingComplete: () {
                    myFocusNode.requestFocus();
                  },
                  validator: validatorName,
                  onChanged: (value) => dogMap['name'] = value,
                  decoration: InputDecoration(label: Text('Name')),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  initialValue:
                      dogMap['age'] == 0 ? '' : dogMap['age'].toString(),
                  validator: validator,
                  focusNode: myFocusNode,
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      dogMap['age'] = value.isNotEmpty ? int.parse(value) : 0,
                  decoration: InputDecoration(label: Text('Age')),
                )
              ],
            )),
      ),
    );
  }
}

class HelperDb {
  static Database? _db;
  final _controller = StreamController<List<Dog>>();
  static const _dbName = 'doggie_database.db';
  StreamController<List<Dog>> get controller => _controller;

  Future<Database> get db async {
    if (_db == null || !_db!.isOpen) {
      _db = await initDb();
      return _db!;
    }
    return _db!;
  }

  closeDb() async {
    return await _db!.close();
  }

  initDb() async {
    // Open the database and store the reference.
    return await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), _dbName),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) async {
        // Run the CREATE TABLE statement on the database.
        await db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  // Define a function that inserts dogs into the database
  Future<void> insertDog(Dog dog) async {
    // Get a reference to the database.
    var dbClient = await db;
    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await dbClient.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Dog>> dogs(String name) async {
    // Get a reference to the database.
    var dbClient = await db;
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await dbClient
        .query('dogs', where: 'name LIKE ?', whereArgs: ['%$name%']);
    // final List<Map<String, dynamic>> maps =
    //     await dbClient.rawQuery("SELECT * FROM dogs WHERE name LIKE '%$name%'");
    // Convert the List<Map<String, dynamic> into a List<Dog>.
    final dogs = List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
    return dogs;
  }

  Future<void> updateDog(Dog dog) async {
    // Get a reference to the database.
    var dbClient = await db;
    // Update the given Dog.
    await dbClient.update(
      'dogs',
      dog.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    var dbClient = await db;
    // Remove the Dog from the database.
    await dbClient.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<void> test() async {
    // Create a Dog and add it to the dogs table
    var fido = const Dog(
      id: 0,
      name: 'Fido',
      age: 35,
    );

    await insertDog(fido);

    // Now, use the method above to retrieve all the dogs.
    print(await dogs('')); // Prints a list that include Fido.

    // Update Fido's age and save it to the database.
    fido = Dog(
      id: fido.id,
      name: fido.name,
      age: fido.age + 7,
    );
    await updateDog(fido);

    // Print the updated results.
    print(await dogs('')); // Prints Fido with age 42.

    // Delete Fido from the database.
    // await deleteDog(fido.id);

    // Print the list of dogs (empty).
    print(await dogs(''));
  }
}

class Dog {
  final int id;
  final String name;
  final int age;

  const Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  static fromMap(Map<String, dynamic> map) {
    return Dog(id: map['id'], name: map['name'], age: map['age']);
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
