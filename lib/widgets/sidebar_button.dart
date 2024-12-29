// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cerebro_ai/theme/Appcolors.dart';

class SidebarButton extends StatelessWidget {
  final bool isexpanded;
  final IconData iconData;
  final String text;
  const SidebarButton({
    super.key,
    required this.isexpanded,
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isexpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          child: Icon(
            iconData,
            color: AppColors.iconGrey,
            size: 22,
          ),
        ),
        isexpanded
            ? Text(
                text,
                style: TextStyle(
                  // color: AppColors.textGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
