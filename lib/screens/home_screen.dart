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
    return Builder(builder: (context) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildAppBar(),
        body: buildSection(screenWidth, screenHeight),
        endDrawer: Container(
          width: screenWidth < 650 ? screenWidth : screenWidth * 0.5,
          child: Drawer(),
        ),
      );
    });
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

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        "portfolio",
        style: TextStyle(
          fontFamily: "Comfortaa",
          color: Colors.black,
          fontSize: 30,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white, size: 50),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
