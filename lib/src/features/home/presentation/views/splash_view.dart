import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/res/typography.dart';
import '../bloc/home_state.dart';
import '../providers/home_provider.dart';
import '../widgets/home_title.dart';
import 'splash_header_view.dart';

class SplashView extends StatelessWidget {
  final HomeState currentState;

  const SplashView({
    super.key,
    required this.currentState,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, provider, __) {
        if (provider.example == null) {
          return SizedBox.shrink();
        }
        return SafeArea(
          child: Column(
            children: [
              if (currentState is HomeError)
                const SplashHeaderView(),
              Center(
                child: CoreTypography.coreText(text: provider.example!.message),
              ),
              HomeTitle(message: provider.example!.message,)
            ],
          ),
        );
      },
    );
  }
}
