import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dbclasses.dart';
import 'datab.dart';

class CometWidget extends StatefulWidget {
  final int starID;

  const CometWidget({Key? key, required this.starID}) : super(key: key);

  @override
  State<CometWidget> createState() => _CometWidgetState();
}

class _CometWidgetState extends State<CometWidget> {
  late Star star;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshStar();
  }

  Future refreshStar() async {
    setState(() => isLoading = true);
    this.star = await DBProvider.instance.readStar(widget.starID);
    setState(() => isLoading = false);
  }

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
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(
                                      star.name,
                                      style: const TextStyle(
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
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(
                                      star.description,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      child: const Text(
                        'Go Back',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ));
  }
}
