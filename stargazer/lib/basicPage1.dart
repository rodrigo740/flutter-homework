import 'package:flutter/material.dart';
import 'selectionPage.dart';

class BasicPage1 extends StatelessWidget {
  const BasicPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
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
                              Icons.star_border,
                              size: 100,
                            ),
                            title: const Text('Comets List'),
                            subtitle: const Text('Awesome Comets inside!'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SelectionPage()));
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
                        child: Column(children: const [
                          ListTile(
                            leading: Icon(
                              Icons.star_border,
                              size: 100,
                            ),
                            title: Text('Comets List'),
                            subtitle: Text('Awesome Comets inside!'),
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
                        child: Column(children: const [
                          ListTile(
                            leading: Icon(
                              Icons.star_border,
                              size: 100,
                            ),
                            title: Text('Comets List'),
                            subtitle: Text('Awesome Comets inside!'),
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
