import 'package:flutter/cupertino.dart';
import '../config/constants.dart';

class LabelValueItem extends StatelessWidget {
  final String iconName;
  final Color iconColor;
  final String label;
  final TextStyle textStyle;

  const LabelValueItem(
      {required this.iconName,
        required this.iconColor,
        required this.label,
        required this.textStyle,
        super.key}
      );

  @override
  Widget build(BuildContext context) {
    return Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(ICONS_MAP[iconName], color: iconColor),
          const SizedBox(width: 10),
          Text('  R\$$label', style: textStyle)
        ]);
  }
}