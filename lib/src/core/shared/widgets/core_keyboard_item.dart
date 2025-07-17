import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../res/colours.dart';
import '../../res/typography.dart';

class CoreKeyboardItem extends StatelessWidget {
  final void Function(String) onKeyTap;
  final String keyValue;

  const CoreKeyboardItem({
    super.key,
    required this.keyValue,
    required this.onKeyTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onKeyTap(keyValue),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colours.tripReviewBgColor,
        foregroundColor: Colours.grey,
        fixedSize: Size(
          context.widthScale * 64,
          context.widthScale * 64,
        ),
        shadowColor: Colors.transparent,
      ),
      child: CoreTypography.coreText(
        text: keyValue,
        color: Colours.grey,
        fontSize: 24,
        fontWeight: CoreTypography.regular,
        textAlign: TextAlign.center,
      ),
    );
  }
}
