import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/tab_controller_handler.dart';

class NavigationArrow extends StatelessWidget {
  const NavigationArrow({Key? key, required this.isBackArrow})
      : super(key: key);

  final bool isBackArrow;

  @override
  Widget build(BuildContext context) {
    final TabController? controller =
        TabControllerHandler.of(context)?.controller;
    return Align(
      alignment: isBackArrow ? Alignment.centerLeft : Alignment.centerRight,
      child: IconButton(
        icon: Icon(isBackArrow
            ? Icons.arrow_back_ios_rounded
            : Icons.arrow_forward_ios_rounded),
        onPressed: () => controller?.animateTo(
            isBackArrow ? controller.index - 1 : controller.index + 1),
        color: Colors.black,
        splashColor: Colors.transparent,
      ),
    );
  }
}
