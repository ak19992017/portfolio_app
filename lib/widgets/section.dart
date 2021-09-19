import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Color color;
  final Widget child;
  const Section({Key? key, required this.color, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: color,
      child: child,
    );
  }
}
