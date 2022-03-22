import 'package:flutter/material.dart';
import 'package:stargazer/optionsPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dbclasses.dart';
import 'datab.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late List<Star> stars;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshStar();
  }

  Future refreshStar() async {
    setState(() => isLoading = true);
    this.stars = await DBProvider.instance.completeDB();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    int num = 1;
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
                                        'Ready To Take Off to Another Planet?',
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.lobster(
                                            textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 35,
                                        ))),
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
                                    'With this awesome app you will be able to explore a little about our universe, press the button below to start this adventure!',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ],
                        ),
                      )),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 50),
                        child: ElevatedButton(
                          child: const Text(
                            'Explore More',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BasicPage1()));
                          },
                        ),
                      ))
                ],
              ));
  }
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Screen')),
      body: Center(
        child: Text(
          'This is a new screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
