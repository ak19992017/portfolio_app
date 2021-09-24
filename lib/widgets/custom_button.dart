// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/on_hover_button.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;
  final double padding;
  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color = Colors.green,
    this.padding = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHoverButton(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          padding: MaterialStateProperty.all(EdgeInsets.all(padding)),
        ),
      ),
    );
  }
}
