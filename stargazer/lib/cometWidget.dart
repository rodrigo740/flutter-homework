import 'package:flutter/material.dart';
import 'datab.dart';
import 'dbclasses.dart';

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
            : Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                    child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.yellow, Colors.cyan],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Column(
                    children: [
                      Text(
                        star.name,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          star.description,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
