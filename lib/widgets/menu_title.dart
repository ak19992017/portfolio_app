import 'package:flutter/material.dart';

class MenuTitle extends StatelessWidget {
  final String text;
  final String routeName;
  const MenuTitle({
    Key? key,
    required this.text,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Text(
        text,
        style: TextStyle(fontSize: screenWidth / 18),
      ),
    );
  }
}
