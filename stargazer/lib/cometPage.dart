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
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(15),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      star.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      star.description,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )
                  ],
                ),
              ));
  }
}
