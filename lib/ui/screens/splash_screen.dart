import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset('assets/images/background.svg',
              fit: BoxFit.cover,
              width: screenSize.width, height: screenSize.height),
          Center(
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              width: 160,
              fit: BoxFit.scaleDown,
            ),
          )
        ],
      ),
    );
  }
}
