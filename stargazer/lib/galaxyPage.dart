import 'dart:ui';
import 'package:flutter/material.dart';
import 'dbclasses.dart';
import 'datab.dart';

class GalaxyPage extends StatefulWidget {
  const GalaxyPage({Key? key}) : super(key: key);

  @override
  State<GalaxyPage> createState() => _GalaxyPageState();
}

class _GalaxyPageState extends State<GalaxyPage> {
  late List<Star> stars;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshStar();
  }

  Future refreshStar() async {
    setState(() => isLoading = true);
    this.stars = await DBProvider.instance.galaxys();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: const Text('All Stars',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.transparent)),
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
                                      padding: const EdgeInsets.all(15),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Image.memory(stars[0]
                                                .dataFromBase64String(
                                                    stars[index].image)),
                                            Text(
                                              stars[index].description,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
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
