// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  bool isFabVisible = true;

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
        return Scaffold(
          extendBodyBehindAppBar: true,
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                floating: true,
                snap: true,
                title: Text(
                  "Portfolio",
                  style: TextStyle(fontFamily: "Comfortaa"),
                ),
                elevation: 0,
                centerTitle: true,
                // backgroundColor: Colors.transparent,
              ),
            ],
            body: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                if (notification.direction == ScrollDirection.forward) {
                  if (!isFabVisible) setState(() => isFabVisible = true);
                } else if (notification.direction == ScrollDirection.reverse) {
                  if (isFabVisible) setState(() => isFabVisible = false);
                }
                return true;
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Section(
                      color: Colors.grey,
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
                                        fontSize: screenWidth > 650
                                            ? screenWidth / 18
                                            : screenWidth / 15,
                                        fontWeight: FontWeight.bold,
                                        height: 1.2,
                                        letterSpacing: 0.1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 40),
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
                    Section(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "I enjoy creating delightful,\nhuman-centered digital experiences.",
                                style: TextStyle(
                                  fontSize: screenWidth / 28,
                                ),
                              ),
                              SizedBox(height: 50),
                              Text(
                                screenWidth < 650
                                    ? "Think.\nMake.\nSolve."
                                    : "Think.Make.\nSolve.",
                                style: TextStyle(
                                  fontSize: screenWidth < 650
                                      ? screenWidth / 9
                                      : screenWidth / 18,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                  letterSpacing: 0.1,
                                ),
                              ),
                              SizedBox(height: 20),
                              OnHoverButton(
                                child: Container(
                                  width: screenWidth < 650
                                      ? double.infinity
                                      : null,
                                  child: CustomButton(
                                    text: 'Contact Me',
                                    onPressed: () {},
                                    padding: 25,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    Section(
                      color: Colors.amber,
                      child: Padding(
                        padding: EdgeInsets.all(50),
                        child: Column(
                          children: [
                            Text(
                              "Look at My\nProducts.",
                              style: TextStyle(
                                fontSize: screenWidth / 18,
                                fontWeight: FontWeight.bold,
                                height: 1.0,
                                letterSpacing: 0.01,
                              ),
                            ),
                            SizedBox(height: 20),
                            Card(
                              shadowColor: Colors.red,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              clipBehavior: Clip.antiAlias,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.redAccent, Colors.red],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Coloured card',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "This card is rounded and has a gradient ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Section(color: Colors.redAccent, child: Container()),
                    Section(color: Colors.deepPurpleAccent, child: Container()),
                  ],
                ),
              ),
            ),
          ),
          drawer: CustomDrawer(context: context, screenWidth: screenWidth),
          floatingActionButton: isFabVisible
              ? FloatingActionButton(onPressed: () {}, child: Icon(Icons.add))
              : null,
        );
      },
    );
  }
}
