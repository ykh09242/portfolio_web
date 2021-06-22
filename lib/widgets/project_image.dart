import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:portfolio_web/utils/project_model.dart';

class ProjectImage extends StatelessWidget {
  const ProjectImage({Key? key, required this.project, this.onPressed})
      : super(key: key);

  final Project project;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final double imageSize = MediaQuery.of(context).size.height * 0.2;
    final BorderRadius borderRadius = BorderRadius.circular(20);

    return Theme(
      data: ThemeData(
          splashColor: Colors.transparent, highlightColor: Colors.transparent),
      child: HoverCrossFadeWidget(
          firstChild: ClipRRect(
            borderRadius: borderRadius,
            child: Image.asset(
              project.imageURL,
              width: imageSize,
              height: imageSize,
              fit: BoxFit.cover,
            ),
          ),
          secondChild: SizedBox(
            height: imageSize,
            width: imageSize,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: borderRadius),
                  shadowColor: Colors.transparent),
              child: Text(
                project.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          duration: const Duration(milliseconds: 200)),
    );
  }
}
