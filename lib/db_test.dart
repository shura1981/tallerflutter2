import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// WidgetsFlutterBinding.ensureInitialized();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppDb(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppDb extends StatefulWidget {
  AppDb({Key? key}) : super(key: key);

  @override
  State<AppDb> createState() => _AppDbState();
}

class _AppDbState extends State<AppDb> {
  late HelperDb _helperDb;
  @override
  initState() {
    _helperDb = HelperDb();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _helperDb.closeDb();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test db')),
      body: FutureBuilder(
          future: _helperDb.dogs(),
          builder: (context, AsyncSnapshot<List<Dog>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data!.isEmpty) {
                return Center(child: Text('Vacio'));
              } else {
                final item = snapshot.data;
                return ListDogs(item: item);
              }
            }
            return Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // _helperDb.test().then((value) => setState(() {}));
            Navigator.push<Dog>(
              context,
              MaterialPageRoute<Dog>(
                builder: (BuildContext context) =>
                    FullScreenDialogDog(), // fullscreenDialog: true,
              ),
            ).then((value) {
              print(value);
            });
          },
          child: Icon(Icons.add)),
    );
  }
}

class ListDogs extends StatelessWidget {
  const ListDogs({
    Key? key,
    required this.item,
  }) : super(key: key);

  final List<Dog>? item;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final dog = item![index];

          return ListTile(
            title: Text(dog.name),
            subtitle: Text('Age ${dog.age}'),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: item!.length);
  }
}

class FullScreenDialogDog extends StatefulWidget {
  @override
  State<FullScreenDialogDog> createState() => _FullScreenDialogDogState();
}

class _FullScreenDialogDogState extends State<FullScreenDialogDog> {
  late FocusNode myFocusNode;
  final dogMap = <String, dynamic>{'id': 0, 'name': '', 'age': 0};
  @override
  void initState() {
    super.initState();

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
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
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
                if (dogMap.isEmpty) {
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

                dogMap['id'] = 239;
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
            child: Column(
          children: [
            TextFormField(
              onEditingComplete: () {
                myFocusNode.requestFocus();
              },
              onChanged: (value) => dogMap['name'] = value,
              decoration: InputDecoration(label: Text('Name')),
            ),
            TextFormField(
              focusNode: myFocusNode,
              onChanged: (value) => dogMap['age'] = value as int,
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

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
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
      join(await getDatabasesPath(), 'doggie_database.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
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
  Future<List<Dog>> dogs() async {
    // Get a reference to the database.
    var dbClient = await db;
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await dbClient.query('dogs');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
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
    print(await dogs()); // Prints a list that include Fido.

    // Update Fido's age and save it to the database.
    fido = Dog(
      id: fido.id,
      name: fido.name,
      age: fido.age + 7,
    );
    await updateDog(fido);

    // Print the updated results.
    print(await dogs()); // Prints Fido with age 42.

    // Delete Fido from the database.
    // await deleteDog(fido.id);

    // Print the list of dogs (empty).
    print(await dogs());
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