import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final double fontSize = getFontSize(context);
    return Tab(child: Text(title, style: TextStyle(fontSize: fontSize)));
  }

  double getFontSize(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontSize = screenWidth > 950 && screenHeight > 550 ? 15 : 13;
    return fontSize;
  }
}
