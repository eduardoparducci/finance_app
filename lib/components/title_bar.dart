import 'package:flutter/material.dart';
import '../config/app_styles.dart';
import '../config/constants.dart';

class TitleBar extends StatelessWidget {

  final String title;
  final String subtitle;
  final String iconName;

  const TitleBar({
    super.key,
    required this.title,
    this.subtitle = '',
    this.iconName = ''
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle, style: Styles.subtitle1),
            Text(title, style: Styles.title1)
          ],
        ),
        Icon(ICONS_MAP[iconName], size: 30, color: Styles.dark)
      ],
    );
  }
}