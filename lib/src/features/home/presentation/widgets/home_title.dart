import 'package:flutter/material.dart';

import '../../../../core/res/typography.dart';
import '../../domain/entities/example.dart';
import '../screens/splash_screen.dart';

class HomeTitle extends StatelessWidget {
  final String message;

  const HomeTitle({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CoreTypography.coreText(text: message),
    );
  }
}
