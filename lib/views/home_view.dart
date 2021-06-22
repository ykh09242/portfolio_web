import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/theme_selector.dart';
import 'package:portfolio_web/utils/view_wrapper.dart';
import 'package:portfolio_web/widgets/navigation_arrow.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ViewWrapper(desktopView: desktopView(), mobileView: mobileView());
  }

  Widget desktopView() {
    return Stack(
      children: <Widget>[
        const NavigationArrow(isBackArrow: false),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: screenWidth * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  header(getFontSize(true)),
                  SizedBox(height: screenHeight * 0.05),
                  subHeader('Computer Scientist.', getFontSize(false)),
                  SizedBox(height: screenHeight * 0.01),
                  subHeader('App Developer.', getFontSize(false)),
                  SizedBox(height: screenHeight * 0.01),
                  subHeader('Flutter Enthusiast.', getFontSize(false)),
                  SizedBox(height: screenHeight * 0.1),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            profilePicture()
          ],
        )
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: <Widget>[
        SizedBox(height: screenHeight * 0.05),
        profilePicture(),
        SizedBox(height: screenHeight * 0.02),
        header(30),
        SizedBox(height: screenHeight * 0.01),
        subHeader('Computer Scientist - App Developer - Flutter Enthusiast', 15)
      ],
    );
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 400;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 350;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 300;
    } else {
      return 250;
    }
  }

  double getFontSize(bool isHeader) {
    final double fontSize = screenWidth > 950 && screenHeight > 550 ? 30 : 25;
    return isHeader ? fontSize * 2.25 : fontSize;
  }

  Widget profilePicture() {
    return ClipOval(
      child: Container(
        width: getImageSize(),
        height: getImageSize(),
        color: Colors.grey,
      ), /*Image.asset(
        'images/picture.png',
        width: getImageSize(),
        height: getImageSize(),
        fit: BoxFit.cover,
      ),*/
    );
  }

  Widget header(double fontSize) {
    return RichText(
      text: TextSpan(
        style: ThemeSelector.selectHeadline(context),
        children: const <TextSpan>[
          TextSpan(text: 'Hi, my name is '),
          TextSpan(text: 'Florian', style: TextStyle(color: Color(0xFF21A179))),
          TextSpan(text: '!'),
        ],
      ),
    );
  }

  Widget subHeader(String text, double fontSize) {
    return Text(text, style: ThemeSelector.selectSubHeadline(context));
  }
}
