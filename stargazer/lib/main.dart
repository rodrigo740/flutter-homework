import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'galaxyPage.dart';
import 'homePageWidget.dart';
import 'cometPage.dart';

import 'starsPage.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      title: 'Stargazer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Stargazer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: const Text('Stargazer',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.transparent)),
          centerTitle: true,
          backgroundColor: Colors.transparent),
      body: HomePageWidget(),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: ListTile.divideTiles(context: context, tiles: [
              ListTile(
                title: const Text('Comets'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CometPage()));
                },
              ),
              ListTile(
                title: const Text('Stars'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => StarsPage()));
                },
              ),
              ListTile(
                title: const Text('Galaxies'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => GalaxyPage()));
                },
              ),
            ]).toList(),
          )
        ],
      )),
    );
  }
}
