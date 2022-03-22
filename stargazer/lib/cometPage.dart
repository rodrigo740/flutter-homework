import 'dart:ui';
import 'package:flutter/material.dart';
import 'dbclasses.dart';
import 'datab.dart';
import 'package:google_fonts/google_fonts.dart';

class CometPage extends StatefulWidget {
  const CometPage({Key? key}) : super(key: key);

  @override
  State<CometPage> createState() => _CometPageState();
}

class _CometPageState extends State<CometPage> {
  late List<Star> stars;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshStar();
  }

  Future refreshStar() async {
    setState(() => isLoading = true);
    this.stars = await DBProvider.instance.comets();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Text('All Comets',
              style: GoogleFonts.lobster(
                  textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 35,
              ))),
          backgroundColor: Colors.transparent),
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
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                  child: Container(),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(40, 150, 40, 90),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: stars.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                            width: 300,
                            height: 600,
                            child: SingleChildScrollView(
                              child: Card(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Image.memory(
                                              stars[0].dataFromBase64String(
                                                  stars[index].image),
                                              width: 300,
                                              height: 300,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Text(
                                                stars[index].description,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17),
                                              ),
                                            )
                                          ],
                                        ),
                                      ))),
                            ));
                      },
                    )),
              ],
            ),
    );
  }
}
