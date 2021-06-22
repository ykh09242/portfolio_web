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
        imageURL: 'project1.jpg',
        description:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.'),
    Project(
        title: 'Project 2',
        imageURL: 'project2.jpg',
        description:
            'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?'),
    Project(
        title: 'Project 3',
        imageURL: 'project3.jpg',
        description:
            'Frac suàvitate mœdus férrî. La nourtiotre, à errœr près ne mils facîlis terme melîore de Je vidërèr port hir qûém né le aliments maison cùm èrrœr neç, démortene prodessêt, reur Pier alîenum êst. Ùt le taçimatés pro ceptes numquam men suble in comple de fenêtre pertinax. Nat insolens nommence. Éi ad nail appèterê èûm des mœdêratius quîdam. Id plâcèràt bands et dicunt diàm à per àd. Naient eà n’onvectioncroprésainte se at rèferrëntûr an erant cial. Fiancois nô omnèsqûe peur èos témpor d’un phaedrûm voin împedit de pro in œptiôn Aliqùid es. Et vîdé nam dèle ullùm es nours l’émon vis,')
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
