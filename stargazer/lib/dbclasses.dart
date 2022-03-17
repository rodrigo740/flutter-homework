import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'stars_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE stars(id INTEGER PRIMARY KEY, name TEXT, description TEXT)',
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
      );
    });
  }

  var halley = const Star(
    id: 0,
    name: 'Halley\'s Comet',
    description:
        'Cometa Halley, oficialmente designado 1P/Halley, é um cometa periódico, visível na Terra a cada 75 or 76 anos. O Halley é o único cometa de curto período que é regularmente visível a olho nu da Terra, e o único cometa a olho nu a aparecer nos céus duas vezes durante uma só geração humana.',
  );

  await insertStar(halley);

  // Now, use the method above to retrieve all the stars.
  print(await stars()); // Prints a list that include halley.
}

class Star {
  final int id;
  final String name;
  final String description;

  const Star({
    required this.id,
    required this.name,
    required this.description,
  });

  // Convert a Star into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  // Implement toString to make it easier to see information about
  // each star when using the print statement.
  @override
  String toString() {
    return 'Star{id: $id, name: $name, description: $description}';
  }
}
