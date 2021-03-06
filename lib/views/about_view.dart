import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/theme_selector.dart';
import 'package:portfolio_web/utils/view_wrapper.dart';
import 'package:portfolio_web/widgets/bullet_list.dart';
import 'package:portfolio_web/widgets/navigation_arrow.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView>
    with SingleTickerProviderStateMixin {
  late double screenWidth;
  late double screenHeight;
  String loremIpsum =
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.';

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return ViewWrapper(
      desktopView: desktopView(),
      mobileView: mobileView(),
    );
  }

  Widget desktopView() {
    return Stack(
      children: <Widget>[
        const NavigationArrow(isBackArrow: false),
        const NavigationArrow(isBackArrow: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 1),
            Expanded(flex: 3, child: infoSection()),
            const Spacer(flex: 1),
            Expanded(
                flex: 3,
                child: BulletList(
                  strings: <String>[
                    loremIpsum,
                    loremIpsum,
                    loremIpsum,
                    loremIpsum
                  ],
                )),
            const Spacer(flex: 1),
          ],
        )
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: <Widget>[
        SizedBox(height: screenHeight * 0.05),
        infoText(),
        SizedBox(height: screenHeight * 0.05),
        SizedBox(
          height: screenHeight * 0.3,
          child: BulletList(
            strings: <String>[loremIpsum, loremIpsum, loremIpsum, loremIpsum],
          ),
        ),
      ],
    );
  }

  Widget infoSection() {
    return SizedBox(
      width: screenWidth * 0.35,
      child: Column(
        children: <Widget>[
          profilePicture(),
          SizedBox(height: screenHeight * 0.05),
          infoText()
        ],
      ),
    );
  }

  Widget profilePicture() {
    return ClipOval(
        child: Container(
      alignment: Alignment.center,
      width: getImageSize(),
      height: getImageSize(),
      color: Colors.grey,
      child: const Text(
        'PLACEHOLDER IMAGE',
        textAlign: TextAlign.center,
      ),
    ));
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 350;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 300;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 200;
    } else {
      return 150;
    }
  }

  Widget infoText() {
    return AutoSizeText(
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
      maxFontSize:
          ThemeSelector.selectBodyText(context)?.fontSize ?? double.infinity,
      style: ThemeSelector.selectBodyText(context),
    );
  }
}
