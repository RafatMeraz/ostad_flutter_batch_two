import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenBackground extends StatelessWidget {
  final Widget widget;

  const ScreenBackground({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        SvgPicture.asset('assets/images/background.svg',
            fit: BoxFit.cover,
            width: screenSize.width,
            height: screenSize.height),
        widget
      ],
    );
  }
}
