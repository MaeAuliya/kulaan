import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../res/colours.dart';
import '../../res/typography.dart';

class CoreSubTitle extends StatelessWidget {
  final String title;
  final bool isRequired;

  const CoreSubTitle({
    super.key,
    required this.title,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return isRequired
        ? Row(
            spacing: context.widthScale * 4,
            children: [
              CoreTypography.coreText(
                text: title,
              ),
              CoreTypography.coreText(text: '*', color: Colours.errorColor)
            ],
          )
        : CoreTypography.coreText(
            text: title,
          );
  }
}
