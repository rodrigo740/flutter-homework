import 'package:flutter/material.dart';
import 'datab.dart';
import 'dbclasses.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  //late List<Star> stars;
  bool isLoading = false;
  /*
  @override
  void initState() {
    super.initState();

    refreshStar();
  }

  Future refreshStar() async {
    setState(() => isLoading = true);
    this.stars = await DBProvider.instance.stars();
    setState(() => isLoading = false);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Stack(
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
                            Row(
                              children: const [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      'Ready To Take Off to Another Planet',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: const [
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    'A comet is an icy, small Solar System body that, when passing close to the Sun, warms and begins to release gases, a process that is called outgassing. This produces a visible atmosphere or coma, and sometimes also a tail.',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ],
                        ),
                      )),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        onPressed: null,
                        child: Text(
                          'asd',
                        )),
                  )
                ],
              ));
  }
}
