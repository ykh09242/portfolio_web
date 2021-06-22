import 'package:flutter/material.dart';

class TabControllerHandler extends InheritedWidget {
  const TabControllerHandler({
    Key? key,
    required this.controller,
    required Widget child,
  }) : super(key: key, child: child);

  final TabController controller;

  static TabControllerHandler? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TabControllerHandler>();
  }

  @override
  bool updateShouldNotify(TabControllerHandler oldWidget) {
    return oldWidget.controller != controller;
  }
}
