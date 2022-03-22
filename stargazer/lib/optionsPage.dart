import 'package:flutter/material.dart';
import 'galaxyPage.dart';
import 'cometPage.dart';
import 'starsPage.dart';
import 'custom_icons_icons.dart';

class BasicPage1 extends StatelessWidget {
  const BasicPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: const Text('',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.transparent)),
          backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/homepage.png',
            fit: BoxFit.cover,
            height: double.maxFinite,
            width: double.maxFinite,
          ),
          Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    width: 370,
                    height: 120,
                    child: Card(
                        color: Colors.white.withOpacity(0.7),
                        child: Column(children: [
                          ListTile(
                            leading: const Icon(
                              CustomIcons.comet_svgrepo_com,
                              size: 90,
                            ),
                            title: const Text('Comets List'),
                            subtitle: const Text('Awesome Comets inside!'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const CometPage()));
                            },
                          ),
                        ])),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 370,
                    height: 120,
                    child: Card(
                        color: Colors.white.withOpacity(0.7),
                        child: Column(children: [
                          ListTile(
                            leading: const Icon(
                              Icons.star_border,
                              size: 90,
                            ),
                            title: const Text('Stars List'),
                            subtitle: const Text('Awesome Stars inside!'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const StarsPage()));
                            },
                          ),
                        ])),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 370,
                    height: 120,
                    child: Card(
                        color: Colors.white.withOpacity(0.7),
                        child: Column(children: [
                          ListTile(
                            leading: const Icon(
                              CustomIcons.earth,
                              size: 90,
                            ),
                            title: const Text('Galaxies List'),
                            subtitle: const Text('Awesome Galaxies inside!'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const GalaxyPage()));
                            },
                          ),
                        ])),
                  )
                ],
              )))
        ],
      ),
    );
  }
}
