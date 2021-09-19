// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/menu_title.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.context,
    required this.screenWidth,
  }) : super(key: key);

  final BuildContext context;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth < 650 ? screenWidth : screenWidth * 0.5,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Drawer(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MenuTitle(text: "Projects", routeName: '/project'),
                MenuTitle(text: "Blog", routeName: '/blog'),
                MenuTitle(text: "Contact Us", routeName: '/contact'),
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
}
