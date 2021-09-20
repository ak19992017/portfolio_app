// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/custom_button.dart';
import 'package:portfolio_app/widgets/on_hover_text.dart';

class CustomDrawer extends StatefulWidget {
  final BuildContext context;
  final double screenWidth;
  static final texts = ["Projects", "Blog", "Settings", "Contact"];
  const CustomDrawer({
    Key? key,
    required this.context,
    required this.screenWidth,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth < 650
          ? widget.screenWidth
          : widget.screenWidth * 0.5,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.all(16),
                separatorBuilder: (context, index) => Divider(),
                itemCount: CustomDrawer.texts.length,
                itemBuilder: (context, index) {
                  final text = CustomDrawer.texts[index];
                  return Center(
                    child: OnHoverText(builder: (bool isHovered) {
                      final color = isHovered ? Colors.orange : Colors.black;
                      return Container(
                        width: 160,
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 32, color: color),
                        ),
                      );
                    }),
                  );
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: 'Close Drawer',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
