// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> translateAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    translateAnimation = Tween<Offset>(
            begin: Offset.zero, end: Offset(1.5, 0.0))
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticIn));

    controller.addListener(() {
      setState(() {});
    });

    controller.reverse(from: 1);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Builder(
      builder: (context) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: buildAppBar(screenWidth),
          body: SingleChildScrollView(
            child: Column(
              children: [
                buildSection(screenWidth, screenHeight),
                Section(color: Colors.red),
                Section(color: Colors.green),
                Section(color: Colors.amber),
              ],
            ),
          ),
          endDrawer: buildDrawer(screenWidth),
        );
      },
    );
  }

  Container buildDrawer(double screenWidth) {
    return Container(
      width: screenWidth < 650 ? screenWidth : screenWidth * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        child: Drawer(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('This is the Drawer'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close Drawer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildSection(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              color: Colors.white70,
              child: SlideTransition(
                position: translateAnimation,
                child: Text(
                  """Hello, my\nname’s Aditya.\nI’m a Flutter\nDeveloper.""",
                  style: TextStyle(
                    fontSize: screenWidth / 18,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                    letterSpacing: 0.01,
                  ),
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Color(0XFF9747FF),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(double screenWidth) {
    return AppBar(
      title: Text(
        "portfolio",
        style: TextStyle(
          fontFamily: "Comfortaa",
          color: Colors.black,
          fontSize: 30,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white, size: screenWidth / 25),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}

class Section extends StatelessWidget {
  final Color color;
  const Section({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: color,
    );
  }
}
