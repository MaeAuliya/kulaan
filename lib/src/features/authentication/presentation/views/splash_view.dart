import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: CoreTypography.coreText(
                text: 'Kulaan.',
                color: Colours.gold,
                fontSize: 40,
                fontWeight: CoreTypography.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(context.widthScale * 16),
            child: CoreTypography.coreText(
              text: 'Version 1.0.0',
              color: Colours.white,
              fontSize: 16,
              fontWeight: CoreTypography.semiBold,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
