import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
        onPressed: onTap,
        child: Text(
          title,
          style:
              const TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.6),
        ),
      ),
    );
  }
}
