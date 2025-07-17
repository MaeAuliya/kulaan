import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/utils/core_utils.dart';
import '../../../navigation/presentation/views/user_bottom_navigation.dart';
import '../bloc/authentication_bloc.dart';
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
    context.authBloc.add(const SignInWithCredentialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.primaryBlue,
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) async {
          if (state is SignInWithCredentialError) {
            CoreUtils.showSnackBar(
              context: context,
              message: state.errorMessage,
              isError: true,
            );
          } else if (state is SignInWithCredentialFailed) {
            Future.delayed(const Duration(seconds: 2), () {
              if (!context.mounted) return;
              Navigator.pushReplacementNamed(context, UserBottomNavigationCore.routeName);
            });
          } else if (state is SignInWithCredentialSuccess) {
            debugPrint(state.currentUser.toString());
            context.userProvider.updateUser(state.currentUser);
            Future.delayed(const Duration(seconds: 2), () {
              if (!context.mounted) return;
              Navigator.pushReplacementNamed(context, UserBottomNavigationCore.routeName);
            });
          }
        },
        builder: (context, state) => const SplashView(),
      ),
    );
  }
}
