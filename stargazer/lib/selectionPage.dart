import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stargazer/cometPage.dart';
import 'dbclasses.dart';
import 'datab.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  late List<Star> stars;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshStar();
  }

  Future refreshStar() async {
    setState(() => isLoading = true);
    this.stars = await DBProvider.instance.stars();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('All Comets',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              )),
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
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(50),
                    width: 360.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: stars.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                            width: 300,
                            child: Card(
                              child: ClipRect(
                                child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: Padding(
                                        padding: const EdgeInsets.all(15),
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
                                        ))),
                              ),
                            ));
                      },

                      /*
                            for (var i = 0; i < stars.length; i++) {
                              
                            }
                            Card(
                                child: ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  width: 360.0,
                                  height: 450.0,
                                  child: Text(
                                    stars[0].description,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ))*/
                    ))
              ],
            ),
    );
  }
}
