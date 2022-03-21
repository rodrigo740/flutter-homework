import 'dart:async';
import 'dart:io' as Io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'dbclasses.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:developer';

/*
void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final database = openDatabase(
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

  // Define a function that inserts dogs into the database
  Future<void> insertDog(Dog dog) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Dog>> dogs() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');

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
    final db = await database;

    // Update the given Dog.
    await db.update(
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
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

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
  await deleteDog(fido.id);

  // Print the list of dogs (empty).
  print(await dogs());
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

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}*/

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'starsDatabase.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE stars(id INTEGER PRIMARY KEY, name TEXT, description TEXT, image TEXT)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

// Define a function that inserts stars into the database
  Future<void> insertStar(Star star) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Star into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'stars',
      star.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// A method that retrieves all the stars from the stars table.
  Future<List<Star>> stars() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Stars.
    final List<Map<String, dynamic>> maps = await db.query('stars');

    // Convert the List<Map<String, dynamic> into a List<Star>.
    return List.generate(maps.length, (i) {
      return Star(
        id: maps[i]['id'],
        name: maps[i]['name'],
        description: maps[i]['description'],
        image: maps[i]['image'],
      );
    });
  }

  var status = await Permission.storage.request().isGranted;

  final bytes =
      Io.File('/storage/emulated/0/Download/logo.png').readAsBytesSync();
  String img64 = base64Encode(bytes);

  var halley = Star(
    id: 0,
    name: 'Halley\'s Comet',
    description:
        'Cometa Halley, oficialmente designado 1P/Halley, é um cometa periódico, visível na Terra a cada 75 or 76 anos. O Halley é o único cometa de curto período que é regularmente visível a olho nu da Terra, e o único cometa a olho nu a aparecer nos céus duas vezes durante uma só geração humana.',
    image: img64,
  );
  img64 = base64Encode(bytes);
  await insertStar(halley);

  var rosetta = Star(
    id: 1,
    name: 'Rosetta',
    description:
        'Rosetta foi uma sonda espacial construída e lançada pela Agência Espacial Europeia com a missão de encontrar-se no espaço e fazer um estudo detalhado do cometa 67P/Churyumov-Gerasimenko, que viaja entre as órbitas da Terra e de Júpiter.',
    image: img64,
  );

  await insertStar(rosetta);
  img64 = base64Encode(bytes);
  var shoemaker = Star(
    id: 2,
    name: 'Shoemaker-Levy 9',
    description:
        'Shoemaker-Levy 9 foi um cometa descoberto pelos astrônomos Carolyn Shoemaker, Eugene Shoemaker e David H. Levy em 24 de março de 1993, em uma fotografia tirada pelo telescópio Schmidt do Observatório Palomar na Califórnia.',
    image: img64,
  );

  await insertStar(shoemaker);

  List<Star> s = await stars();

  // Now, use the method above to retrieve all the stars.
  for (var i = 0; i < s.length; i++) {
    print(s.toString());
  }
}
