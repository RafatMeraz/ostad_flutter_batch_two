import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    Key? key,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      splashColor: primaryColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: 14,
          child: Icon(
            iconData,
            size: 16,
            color: softGreyColor,
          ),
        ),
      ),
    );
  }
}
