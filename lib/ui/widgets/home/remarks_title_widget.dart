import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/styles.dart';

class RemarksTitleWidget extends StatelessWidget {
  const RemarksTitleWidget({
    Key? key,
    required this.remarksName,
    required this.onTapSeeAll,
  }) : super(key: key);

  final String remarksName;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          remarksName,
          style: titleTextStyle.copyWith(
              fontSize: 18, fontWeight: FontWeight.w600),
        ),
        TextButton(
          onPressed: onTapSeeAll,
          child: const Text(
            'See all',
            style: TextStyle(color: primaryColor),
          ),
        )
      ],
    );
  }
}
