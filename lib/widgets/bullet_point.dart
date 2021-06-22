import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/theme_selector.dart';

class BulletPoint extends StatelessWidget {
  const BulletPoint(
      {Key? key,
      required this.text,
      required this.animationController,
      required this.index})
      : super(key: key);

  final String text;
  final AnimationController animationController;
  final int index;

  @override
  Widget build(BuildContext context) {
    final double _animationStart = 0.1 * index;
    final double _animationEnd = _animationStart + 0.4;

    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
          .animate(CurvedAnimation(
              parent: animationController,
              curve: Interval(_animationStart, _animationEnd,
                  curve: Curves.ease))),
      child: FadeTransition(
        opacity: animationController,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              String.fromCharCode(0x2022),
              style: TextStyle(
                  color: const Color(0xFF21A179),
                  fontSize: ThemeSelector.selectBodyText(context)?.fontSize),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            Flexible(
              child: AutoSizeText(
                text,
                maxFontSize: ThemeSelector.selectBodyText(context)?.fontSize ??
                    double.infinity,
                style: ThemeSelector.selectBodyText(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
