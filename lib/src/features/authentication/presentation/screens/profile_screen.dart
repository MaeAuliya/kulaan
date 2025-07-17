import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/widgets/core_app_bar.dart';
import '../../../../core/utils/core_utils.dart';
import '../bloc/authentication_bloc.dart';
import '../views/profile_view.dart';
import 'sign_in_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CoreAppBar(
        title: 'Account',
        isBackButton: false,
      ),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is SignOutError) {
            Navigator.pop(context);
            CoreUtils.showSnackBar(
              context: context,
              message: state.errorMessage,
              isError: true,
            );
          } else if (state is SignOutLoading) {
            CoreUtils.showLoadingDialog(context);
          } else if (state is SignOutSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              SignInScreen.routeName,
              (route) => false,
            );
          }
        },
        child: const ProfileView(),
      ),
    );
  }
}
