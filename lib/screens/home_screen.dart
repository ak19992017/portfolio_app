// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/custom_button.dart';
import 'package:portfolio_app/widgets/custom_drawer.dart';
import 'package:portfolio_app/widgets/on_hover_button.dart';
import 'package:portfolio_app/widgets/section.dart';

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
    // double screenHeight = MediaQuery.of(context).size.height;
    return Builder(
      builder: (context) {
        return SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: Text(
                "portfolio",
                style: TextStyle(fontFamily: "Comfortaa"),
              ),
              elevation: 0,
              centerTitle: true,
              // backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Section(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Container(
                            color: Colors.white70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SlideTransition(
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
                                SizedBox(height: 40),
                                OnHoverButton(
                                  child: CustomButton(
                                    text: "Discover",
                                    onPressed: () {},
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                        if (screenWidth > 650)
                          Expanded(
                            flex: 5,
                            child: Container(
                              color: Color(0XFF9747FF),
                            ),
                          )
                      ],
                    ),
                  ),
                  Section(color: Colors.green, child: Container()),
                  Section(color: Colors.amber, child: Container()),
                ],
              ),
            ),
            drawer: CustomDrawer(context: context, screenWidth: screenWidth),
            floatingActionButton:
                FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
          ),
        );
      },
    );
  }
}
