import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/widgets/core_app_bar.dart';
import '../../../../core/utils/core_utils.dart';
import '../bloc/authentication_bloc.dart';
import '../views/sign_in_view.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CoreAppBar(title: 'Sign In'),
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is SignInError) {
            Navigator.pop(context);
            CoreUtils.showSnackBar(
              context: context,
              message: state.errorMessage,
              isError: true,
            );
          } else if (state is SignInLoading) {
            CoreUtils.showLoadingDialog(context);
          }
        },
        builder: (_, state) => const SignInView(),
      ),
    );
  }
}
