import 'package:flutter/material.dart';

import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: CoreTypography.coreText(
            text: 'Home Screen',
            color: Colours.darkBlue,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
