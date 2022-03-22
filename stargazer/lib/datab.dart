import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dbclasses.dart';
import 'package:flutter/services.dart' show rootBundle;

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

    starsToAdd();

    return _database!;
  }

  _initDB() async {
    String path = join(await getDatabasesPath(), 'starsDB.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE stars(id INTEGER PRIMARY KEY, name TEXT, description TEXT, image TEXT)');
    });
  }

  insertStar(Star star) async {
    // Insert the Star into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same star is inserted twice.
    //
    // In this case, replace any previous data.
    await _database!.insert(
      'stars',
      star.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// A method that retrieves all the stars from the stars table.
  Future<List<Star>> completeDB() async {
    final db = await instance.database;
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

  Future<List<Star>> comets() async {
    final db = await instance.database;
    // Query the table for all The Stars.
    final List<Map<String, dynamic>> maps = await db.query('stars');

    Star s1 = Star(
      id: maps[0]['id'],
      name: maps[0]['name'],
      description: maps[0]['description'],
      image: maps[0]['image'],
    );

    Star s2 = Star(
      id: maps[1]['id'],
      name: maps[1]['name'],
      description: maps[1]['description'],
      image: maps[1]['image'],
    );

    Star s3 = Star(
      id: maps[2]['id'],
      name: maps[2]['name'],
      description: maps[2]['description'],
      image: maps[2]['image'],
    );

    List<Star> stars = [s1, s2, s3];
    return stars;
  }

  Future<List<Star>> stars() async {
    final db = await instance.database;
    // Query the table for all The Stars.
    final List<Map<String, dynamic>> maps = await db.query('stars');

    Star s1 = Star(
      id: maps[3]['id'],
      name: maps[3]['name'],
      description: maps[3]['description'],
      image: maps[3]['image'],
    );

    Star s2 = Star(
      id: maps[4]['id'],
      name: maps[4]['name'],
      description: maps[4]['description'],
      image: maps[4]['image'],
    );

    Star s3 = Star(
      id: maps[5]['id'],
      name: maps[5]['name'],
      description: maps[5]['description'],
      image: maps[5]['image'],
    );

    List<Star> stars = [s1, s2, s3];
    return stars;
  }

  Future<List<Star>> galaxys() async {
    final db = await instance.database;
    // Query the table for all The Stars.
    final List<Map<String, dynamic>> maps = await db.query('stars');

    Star s1 = Star(
      id: maps[6]['id'],
      name: maps[6]['name'],
      description: maps[6]['description'],
      image: maps[6]['image'],
    );

    Star s2 = Star(
      id: maps[7]['id'],
      name: maps[7]['name'],
      description: maps[7]['description'],
      image: maps[7]['image'],
    );

    Star s3 = Star(
      id: maps[8]['id'],
      name: maps[8]['name'],
      description: maps[8]['description'],
      image: maps[8]['image'],
    );

    List<Star> stars = [s1, s2, s3];
    return stars;
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

  Future<void> deleteStar(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Star from the database.
    await db.delete(
      'stars',
      // Use a `where` clause to delete a specific star.
      where: 'id = ?',
      // Pass the Stars's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  void starsToAdd() async {
    var bytes = await rootBundle.load('assets/images/comet_halley.jpg');
    String img64 = base64Encode(bytes.buffer.asUint8List());

    var halley = Star(
      id: 0,
      name: 'Halley\'s Comet',
      description:
          '''Halley's Comet or Comet Halley, officially designated 1P/Halley, is a short-period comet visible from Earth every 75-76 years. Halley is the only known short-period comet that is regularly visible to the naked eye from Earth, and thus the only naked-eye comet that can appear twice in a human lifetime. Halley last appeared in the inner parts of the Solar System in 1986 and will next appear in mid-2061.

Halley's periodic returns to the inner Solar System have been observed and recorded by astronomers around the world since at least 240 BC. But it was not until 1705 that the English astronomer Edmond Halley understood that these appearances were reappearances of the same comet. As a result of this discovery, the comet is now named after Halley.''',
      image: img64,
    );

    bytes = await rootBundle.load('assets/images/NEOWISE.jpg');

    img64 = base64Encode(bytes.buffer.asUint8List());
    await insertStar(halley);

    var neowise = Star(
      id: 1,
      name: 'NEOWISE',
      description:
          '''C/2020 F3 (NEOWISE) or Comet NEOWISE is a long period comet with a near-parabolic orbit discovered on March 27, 2020, by astronomers during the NEOWISE mission of the Wide-field Infrared Survey Explorer (WISE) space telescope. At that time, it was an 18th-magnitude object, located 2 AU (300 million km; 190 million mi) away from the Sun and 1.7 AU (250 million km; 160 million mi) away from Earth.
NEOWISE is known for being the brightest comet in the northern hemisphere since Comet Hale-Bopp in 1997. It was widely photographed by professional and amateur observers and was even spotted by people living near city centers and areas with light pollution. While it was too close to the Sun to be observed at perihelion, it emerged from perihelion around magnitude 0.5 to 1, making it bright enough to be visible to the naked eye. Under dark skies, it could be seen with the naked eye and remained visible to the naked eye throughout July 2020. By July 30, the comet was about magnitude 5, when binoculars were required near urban areas to locate the comet.
For observers in the northern hemisphere, the comet could be seen on the northwestern horizon, below the Big Dipper. North of 45 degrees north, the comet was visible all night in mid-July 2020. On July 30, Comet NEOWISE entered the constellation of Coma Berenices, below the bright star Arcturus.''',
      image: img64,
    );
    await insertStar(neowise);

    bytes = await rootBundle.load('assets/images/Shoemaker.png');
    img64 = base64Encode(bytes.buffer.asUint8List());

    var shoemaker = Star(
      id: 2,
      name: 'Shoemaker-Levy 9',
      description:
          '''Comet Shoemaker-Levy 9 (formally designated D/1993 F2) broke apart in July 1992 and collided with Jupiter in July 1994, providing the first direct observation of an extraterrestrial collision of Solar System objects. This generated a large amount of coverage in the popular media, and the comet was closely observed by astronomers worldwide. The collision provided new information about Jupiter and highlighted its possible role in reducing space debris in the inner Solar System.

The comet was discovered by astronomers Carolyn and Eugene M. Shoemaker and David Levy in 1993. Shoemaker-Levy 9 (SL9) had been captured by Jupiter and was orbiting the planet at the time. It was located on the night of March 24 in a photograph taken with the 46 cm (18 in) Schmidt telescope at the Palomar Observatory in California. It was the first active comet observed to be orbiting a planet, and had probably been captured by Jupiter around 20 to 30 years earlier.''',
      image: img64,
    );

    await insertStar(shoemaker);

    bytes = await rootBundle.load('assets/images/polaris.jpg');
    img64 = base64Encode(bytes.buffer.asUint8List());

    var polaris = Star(
      id: 3,
      name: 'Polaris',
      description:
          '''Polaris is a star in the northern circumpolar constellation of Ursa Minor. It is designated Ursae Minoris (Latinized to Alpha Ursae Minoris) and is commonly called the North Star or Pole Star. With an apparent visual magnitude that fluctuates around 1.98, it is the brightest star in the constellation and is readily visible to the naked eye at night. The position of the star lies less than a degree away from the north celestial pole, making it the current northern pole star. Historically, the stable position of the star in the northern sky has made it useful for navigation.

The revised Hipparcos parallax gives a distance to Polaris of about 433 light-years (133 parsecs), while calculations by some other methods derive distances up to 35% closer.

Although appearing to the naked eye as a single point of light, Polaris is a triple star system, composed of the primary, a yellow supergiant designated Polaris Aa, in orbit with a smaller companion, Polaris Ab; the pair is in a wider orbit with Polaris B. The outer pair AB were discovered in August 1779 by William Herschel.''',
      image: img64,
    );

    await insertStar(polaris);

    bytes = await rootBundle.load('assets/images/sirius.jpg');
    img64 = base64Encode(bytes.buffer.asUint8List());

    var sirius = Star(
      id: 4,
      name: 'Sirius',
      description:
          '''Sirius is the brightest star in the night sky. Its name is derived from the Greek word Σείριος (Seirios, lit. 'glowing' or 'scorching'). The star is designated Canis Majoris, Latinized to Alpha Canis Majoris, and abbreviated Alpha CMa or CMa. With a visual apparent magnitude of -1.46, Sirius is almost twice as bright as Canopus, the next brightest star. Sirius is a binary star consisting of a main-sequence star of spectral type A0 or A1, termed Sirius A, and a faint white dwarf companion of spectral type DA2, termed Sirius B. The distance between the two varies between 8.2 and 31.5 astronomical units as they orbit every 50 years.

Sirius appears bright because of its intrinsic luminosity and its proximity to the Solar System. At a distance of 2.64 parsecs (8.6 ly), the Sirius system is one of Earth's nearest neighbours. Sirius is gradually moving closer to the Solar System, so it is expected to increase in brightness slightly over the next 60,000 years. After that time, its distance will begin to increase, and it will become fainter, but it will continue to be the brightest star in the Earth's night sky for approximately the next 210,000 years.''',
      image: img64,
    );

    await insertStar(sirius);

    bytes = await rootBundle
        .load('assets/images/Alpha_Beta_and_Proxima_Centauri.jpg');
    img64 = base64Encode(bytes.buffer.asUint8List());

    var abpcentauri = Star(
      id: 5,
      name: 'Alpha_Beta_and_Proxima_Centauri.jpg',
      description:
          '''Alpha Centauri is a gravitationally bound system of the closest stars and exoplanets to our Solar System at 4.37 light-years (1.34 parsecs) from the Sun. The name is Latinized from Centauri, and abbreviated Alpha Cen or Cen. It is a triple star system consisting of Centauri A (officially Rigil Kentaurus), Centauri B (officially Toliman), and the closest star Centauri C (officially Proxima Centauri).

Alpha Centauri A and B are Sun-like stars (Class G and K, respectively), and together they form the binary star Alpha Centauri AB. To the naked eye, the two main components appear to be a single star with an apparent magnitude of -0.27, the brightest star in the southern constellation of Centaurus and the third-brightest in the night sky, outshone only by Sirius and Canopus.

Alpha Centauri A has 1.1 times the mass and 1.5 times the luminosity of the Sun, while Alpha Centauri B is smaller and cooler, at 0.9 times the Sun's mass and less than 0.5 times its luminosity. The pair orbit around a common centre with an orbital period of 79 years. Their elliptical orbit is eccentric, so that the distance between A and B varies from 35.6 AU (astronomical units), or about the distance between Pluto and the Sun, to 11.2 AU, or about the distance between Saturn and the Sun.''',
      image: img64,
    );

    await insertStar(abpcentauri);

    bytes = await rootBundle.load('assets/images/Milky_Way.jpg');
    img64 = base64Encode(bytes.buffer.asUint8List());

    var mway = Star(
      id: 6,
      name: 'Milky Way',
      description:
          '''The Milky Way is the galaxy that includes our Solar System, with the name describing the galaxy's appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye. The term Milky Way is a translation of the Latin via lactea, from the Greek γαλακτικός κύκλος (galaktikos kýklos), meaning "milky circle."From Earth, the Milky Way appears as a band because its disk-shaped structure is viewed from within. Galileo Galilei first resolved the band of light into individual stars with his telescope in 1610. Until the early 1920s, most astronomers thought that the Milky Way contained all the stars in the Universe. Following the 1920 Great Debate between the astronomers Harlow Shapley and Heber Curtis, observations by Edwin Hubble showed that the Milky Way is just one of many galaxies.

The Milky Way is a barred spiral galaxy with an estimated visible diameter of 100,000-200,000 light-years. Recent simulations suggest that a dark matter area, also containing some visible stars, may extend up to a diameter of almost 2 million light-years. The Milky Way has several satellite galaxies and is part of the Local Group of galaxies, which form part of the Virgo Supercluster, which is itself a component of the Laniakea Supercluster.''',
      image: img64,
    );

    await insertStar(mway);

    bytes = await rootBundle.load('assets/images/lmc.jpg');
    img64 = base64Encode(bytes.buffer.asUint8List());

    var lmc = Star(
      id: 7,
      name: 'Large Magellanic Cloud',
      description:
          '''The Large Magellanic Cloud (LMC), or Nubecula Major is a satellite galaxy of the Milky Way. At a distance of around 50 kiloparsecs (≈160,000 light-years), the LMC is the second- or third-closest galaxy to the Milky Way, after the Sagittarius Dwarf Spheroidal (~16 kpc) and the possible dwarf irregular galaxy known as the Canis Major Overdensity. Based on readily visible stars and a mass of approximately 10 billion solar masses, the diameter of the LMC is about 14,000 light-years (4.3 kpc). It is roughly a hundredth as massive as the Milky Way and is the fourth-largest galaxy in the Local Group, after the Andromeda Galaxy (M31), the Milky Way and the Triangulum Galaxy (M33).

The LMC is classified as a Magellanic spiral. It contains a stellar bar that is geometrically off center, suggesting that it was a barred dwarf spiral galaxy before its spiral arms were disrupted, likely by tidal interactions from the Small Magellanic Cloud (SMC) and the Milky Way's gravity.''',
      image: img64,
    );

    await insertStar(lmc);

    bytes = await rootBundle.load('assets/images/Andromeda_Galaxy.jpg');
    img64 = base64Encode(bytes.buffer.asUint8List());

    var andromeda = Star(
      id: 8,
      name: 'Andromeda Galaxy',
      description:
          '''The Andromeda Galaxy, also known as Messier 31, M31, or NGC 224 and originally the Andromeda Nebula (see below), is a barred spiral galaxy approximately 2.5 million light-years (770 kiloparsecs) from Earth and the nearest large galaxy to the Milky Way. The galaxy's name stems from the area of Earth's sky in which it appears, the constellation of Andromeda, which itself is named after the Ethiopian (or Phoenician) princess who was the wife of Perseus in Greek mythology.

The virial mass of the Andromeda Galaxy is of the same order of magnitude as that of the Milky Way, at 1 trillion solar masses (2.0x1042 kilograms). The mass of either galaxy is difficult to estimate with any accuracy, but it was long thought that the Andromeda Galaxy is more massive than the Milky Way by a margin of some 25% to 50%. This has been called into question by a 2018 study that cited a lower estimate on the mass of the Andromeda Galaxy, combined with preliminary reports on a 2019 study estimating a higher mass of the Milky Way. The Andromeda Galaxy has a diameter of about 220,000 ly (67 kpc), making it the largest member of the Local Group in terms of extension.''',
      image: img64,
    );

    await insertStar(andromeda);
  }

  /*
  getSize() async {
    // Query the table for all The Stars.
    final List<Map<String, Object?>> a =
        await _database!.query('SELECT COUNT(*) FROM stars');
  }*/
}
