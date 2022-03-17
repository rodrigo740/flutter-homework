import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class BasicPage1 extends StatelessWidget {
  const BasicPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(
            'images/solar_system.jpg',
            fit: BoxFit.cover,
            height: double.maxFinite,
            width: double.maxFinite,
          ),
          Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                  child: Container(
                child: Column(
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.yellow, Colors.cyan],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      'Solar System',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            ),
                            Row(
                              children: const [
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                      'O Sistema Solar compreende o conjunto constituído pelo Sol e todos os corpos celestes que estão sob seu domínio gravitacional. A estrela central, maior componente do sistema, respondendo por mais de 99,85% da massa total, gera sua energia através da fusão de hidrogênio em hélio, dois de seus principais constituintes.',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white)),
                                ))
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              )))
        ],
      ),
    );
  }
}
