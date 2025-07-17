import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/utils/core_utils.dart';
import '../../../navigation/presentation/views/user_bottom_navigation.dart';
import '../bloc/authentication_bloc.dart';
import '../views/sign_in_view.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const routeName = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.primaryBlue,
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is SignInError) {
            debugPrint(state.errorMessage);
            Navigator.pop(context);
            CoreUtils.showSnackBar(
              context: context,
              message: state.errorMessage,
              isError: true,
            );
          } else if (state is SignInLoading) {
            CoreUtils.showLoadingDialog(context);
          } else if (state is SignInSuccess) {
            Navigator.pop(context);
            Navigator.pushNamed(context, UserBottomNavigationCore.routeName);
          } else if (state is SignInInvalid) {
            Navigator.pop(context);
            context.authProvider.setErrorMessage();
          }
        },
        builder: (_, state) => SignInView(
          emailController: emailController,
          passwordController: passwordController,
        ),
      ),
    );
  }
}
