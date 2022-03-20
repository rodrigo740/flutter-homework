import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dbclasses.dart';

class DBProvider {
  static final DBProvider instance = DBProvider._init();
  static Database? _database;
  DBProvider._init();

  /* = openDatabase(
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
  );*/

  Future<Database> get database async {
    if (_database != null) return _database!;
    // if _database is null we instantiate it
    _database = await _initDB();
    return _database!;
  }

  _initDB() async {
    String path = join(await getDatabasesPath(), 'stars_database.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE stars(id INTEGER PRIMARY KEY, name TEXT, description TEXT)');
    });
  }

  insertStar(Star star) async {
    // Insert the Star into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await _database!.insert(
      'stars',
      star.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// A method that retrieves all the stars from the stars table.
  Future<List<Star>> stars() async {
    // Query the table for all The Stars.
    final List<Map<String, dynamic>> maps = await _database!.query('stars');

    // Convert the List<Map<String, dynamic> into a List<Star>.
    return List.generate(maps.length, (i) {
      return Star(
        id: maps[i]['id'],
        name: maps[i]['name'],
        description: maps[i]['description'],
      );
    });
  }

  Future<Star> readStar(int id) async {
    final db = await instance.database;

    final maps = await db.query('stars WHERE id=$id');

    if (maps.isNotEmpty) {
      return Star.fromJson(maps.first);
    } else {
      throw Exception('ID $id was not found');
    }
  }
  /*
  getSize() async {
    // Query the table for all The Stars.
    final List<Map<String, Object?>> a =
        await _database!.query('SELECT COUNT(*) FROM stars');
  }*/
}
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

  var rosetta = const Star(
    id: 1,
    name: 'Rosetta',
    description:
        'Rosetta foi uma sonda espacial construída e lançada pela Agência Espacial Europeia com a missão de encontrar-se no espaço e fazer um estudo detalhado do cometa 67P/Churyumov-Gerasimenko, que viaja entre as órbitas da Terra e de Júpiter.',
  );

  await insertStar(rosetta);

  var shoemaker = const Star(
    id: 2,
    name: 'Shoemaker-Levy 9',
    description:
        'Shoemaker-Levy 9 foi um cometa descoberto pelos astrônomos Carolyn Shoemaker, Eugene Shoemaker e David H. Levy em 24 de março de 1993, em uma fotografia tirada pelo telescópio Schmidt do Observatório Palomar na Califórnia.',
  );

  await insertStar(shoemaker);

  // Now, use the method above to retrieve all the stars.
  print(await stars()); // Prints a list that include halley.
}
*/