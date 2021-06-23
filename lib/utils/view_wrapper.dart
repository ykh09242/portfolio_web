import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class ViewWrapper extends StatelessWidget {
  const ViewWrapper(
      {Key? key, required this.desktopView, required this.mobileView})
      : super(key: key);

  final Widget desktopView;
  final Widget mobileView;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final double screenHeight = MediaQuery.of(context).size.height;
      if (UniversalPlatform.isAndroid ||
          UniversalPlatform.isIOS ||
          constraints.maxWidth <= 715 ||
          screenHeight <= 550) {
        return mobileView;
      }
      return desktopView;
    });
  }
}
