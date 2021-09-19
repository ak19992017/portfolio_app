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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 60),
      ),
    );
  }
}
