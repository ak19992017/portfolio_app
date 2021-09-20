// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/on_hover_button.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHoverButton(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
