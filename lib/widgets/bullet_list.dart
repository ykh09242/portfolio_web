import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio_web/widgets/bullet_point.dart';

class BulletList extends StatefulWidget {
  const BulletList({Key? key, required this.strings}) : super(key: key);

  final List<String> strings;

  @override
  _BulletListState createState() => _BulletListState();
}

class _BulletListState extends State<BulletList>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    Timer(const Duration(milliseconds: 200), () {
      if (mounted) {
        animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(widget.strings.length * 2, (int index) {
        if (index.isEven) {
          return Flexible(
              flex: 2,
              child: BulletPoint(
                text: widget.strings[index ~/ 2],
                animationController: animationController,
                index: index ~/ 2,
              ));
        } else {
          return const Spacer(flex: 1);
        }
      }),
    );
  }
}
