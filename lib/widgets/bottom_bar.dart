import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/widgets/custom_icon_button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        const Divider(
          height: 2,
          color: Colors.black,
        ),
        SizedBox(
          height: screenHeight * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              CustomIconButton(
                iconData: FontAwesomeIcons.github,
                url: 'https://github.com/ykh09242',
                color: Colors.black,
              ),
              Text('Made with Flutter Web \u00a9 2021',
                  style: TextStyle(color: Colors.black))
            ],
          ),
        )
      ],
    );
  }
}
