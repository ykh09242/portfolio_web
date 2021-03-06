import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/project_model.dart';
import 'package:portfolio_web/utils/view_wrapper.dart';
import 'package:portfolio_web/widgets/navigation_arrow.dart';
import 'package:portfolio_web/widgets/project_image.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  late double screenWidth;
  late double screenHeight;

  List<Project> projects = <Project>[
    Project(
        title: 'Project 1',
        imageURL: 'images/project1.jpg',
        description:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.'),
    Project(
        title: 'Project 2',
        imageURL: 'images/project2.jpg',
        description:
            'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?'),
    Project(
        title: 'Project 3',
        imageURL: 'images/project3.jpg',
        description:
            'Frac su??vitate m??dus f??rr??. La nourtiotre, ?? err??r pr??s ne mils fac??lis terme mel??ore de Je vid??r??r port hir q????m n?? le aliments maison c??m ??rr??r ne??, d??mortene prodess??t, reur Pier al??enum ??st. ??t le ta??imat??s pro ceptes numquam men suble in comple de fen??tre pertinax. Nat insolens nommence. ??i ad nail app??ter?? ????m des m??d??ratius qu??dam. Id pl??c??r??t bands et dicunt di??m ?? per ??d. Naient e?? n???onvectioncropr??sainte se at r??ferr??nt??r an erant cial. Fiancois n?? omn??sq??e peur ??os t??mpor d???un phaedr??m voin ??mpedit de pro in ??pti??n Aliq??id es. Et v??d?? nam d??le ull??m es nours l?????mon vis,')
  ];

/*  @override
  void didChangeDependencies() {
    precacheImage(AssetImage('project1.jpg'), context);
    precacheImage(AssetImage('project2.jpg'), context);
    precacheImage(AssetImage('project3.jpg'), context);
    super.didChangeDependencies();
  }*/

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
    final double space = MediaQuery.of(context).size.height * 0.03;
    final List<Widget> images =
        List<Widget>.generate((projects.length * 1.5).ceil(), (int index) {
      if (index.isEven) {
        return ProjectImage(project: projects[index ~/ 2], onPressed: () {});
      } else {
        return SizedBox(height: space);
      }
    });
    return Stack(
      children: <Widget>[
        const NavigationArrow(isBackArrow: true),
        Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.05, horizontal: screenWidth * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: images,
            ))
      ],
    );
  }

  Widget mobileView() {
    return Column(
      children: const <Widget>[],
    );
  }
}
