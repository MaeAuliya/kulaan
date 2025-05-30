import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extension.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../providers/home_provider.dart';
import '../views/splash_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    context.homeBloc.add(ExampleEvent('Test'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            debugPrint('error');
          } else if (state is ExampleError) {
            debugPrint('example Error');
          } else if (state is ExampleLoading) {
            debugPrint('example loading');
          } else if (state is ExampleSuccess) {
            context.homeProvider.initExample(state.example);
            context.homeBloc.add(ShowDialogEvent());
          } else if (state is ShowDialogSuccess) {
            showDialog(
              context: context,
              builder: (_) => Container(),
            );
          }
        },
        builder: (context, state) => SplashView(
          currentState: state,
        ),
      ),
    );
  }
}
