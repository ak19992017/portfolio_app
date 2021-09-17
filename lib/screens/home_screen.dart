// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:math';

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
  late Animation scaleAnimation;
  late Animation rotateAnimation;
  late Animation<Offset> translateAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    rotateAnimation = Tween<double>(begin: 0, end: pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    translateAnimation = Tween<Offset>(
            begin: Offset.zero, end: Offset(1.5, 0.0))
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticIn));

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Builder(builder: (context) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "portfolio",
            style: TextStyle(
              fontFamily: "Comfortaa",
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          toolbarHeight: screenHeight / 6,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
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
                        fontSize: screenWidth / 16,
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
        ),
        endDrawer: Drawer(),
      );
    });
  }
}
