import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class BasicPage2 extends StatelessWidget {
  const BasicPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(
            'images/proxima_Centauri.jpg',
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
                                      'Proxima Centauri',
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
                                      'Proxima Centauri, Próxima do Centauro, Alpha Centauri C ou simplesmente Próxima, é uma anã vermelha distante aproximadamente 4,22 anos luz na constelação do Centauro que orbita ao redor das estrelas Alpha Centauri A e B formando o sistema triplo Alpha Centauri.',
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
