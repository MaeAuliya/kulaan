import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';
import '../../../../core/shared/widgets/core_button.dart';
import '../../../../core/shared/widgets/core_sub_title.dart';
import '../../../../core/shared/widgets/core_text_field.dart';
import '../../domain/entities/sign_in_params.dart';
import '../bloc/authentication_bloc.dart';
import '../providers/authentication_provider.dart';

class SignInView extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInView({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: SizedBox(
          height: context.height * 0.975,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CoreTypography.coreText(
                      text: 'Selamat Datang di',
                      fontWeight: CoreTypography.medium,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    CoreTypography.coreText(
                      text: 'Kulaan.',
                      color: Colours.gold,
                      fontSize: 40,
                      fontWeight: CoreTypography.bold,
                    ),
                    CoreTypography.coreText(
                      text: 'Platform Jual - Beli Online',
                      fontWeight: CoreTypography.semiBold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: context.width,
                  decoration: const BoxDecoration(
                    color: Colours.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: context.widthScale * 20, vertical: context.heightScale * 28),
                  child: Consumer<AuthenticationProvider>(
                    builder: (_, provider, __) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: context.heightScale * 12,
                      children: [
                        Column(
                          spacing: context.heightScale * 24,
                          children: [
                            Column(
                              spacing: context.heightScale * 2,
                              children: [
                                CoreTypography.coreText(
                                  text: 'Sign In',
                                  fontSize: 28,
                                  fontWeight: CoreTypography.bold,
                                ),
                                CoreTypography.coreText(
                                  text: 'Masuk kedalam akun anda untuk memulai.',
                                  fontSize: 14,
                                  maxLine: 3,
                                  color: Colours.grey,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              spacing: context.heightScale * 18,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: context.heightScale * 4,
                                  children: [
                                    const CoreSubTitle(
                                      title: 'Email',
                                      isRequired: true,
                                    ),
                                    CoreTextField(
                                      controller: emailController,
                                      hintText: 'example@email.com',
                                      borderColor: (provider.emailErrorMessage == null)
                                          ? Colours.greyTextFieldStroke
                                          : Colours.errorColor,
                                      activeBorder: (provider.emailErrorMessage != null)
                                          ? Colours.errorColor
                                          : null,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: context.widthScale * 24),
                                      child: CoreTypography.coreText(
                                        text: provider.emailErrorMessage ?? '',
                                        color: Colours.errorColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: context.heightScale * 4,
                                  children: [
                                    const CoreSubTitle(
                                      title: 'Password',
                                      isRequired: true,
                                    ),
                                    CoreTextField(
                                      controller: passwordController,
                                      obscuringCharacter: '*',
                                      obscureText: !provider.isPasswordShow,
                                      hintText: 'example123',
                                      borderColor: (provider.passwordErrorMessage == null)
                                          ? Colours.greyTextFieldStroke
                                          : Colours.errorColor,
                                      activeBorder: (provider.passwordErrorMessage != null)
                                          ? Colours.errorColor
                                          : null,
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          provider.showPassword();
                                        },
                                        icon: Icon(
                                          !provider.isPasswordShow
                                              ? CupertinoIcons.eye
                                              : CupertinoIcons.eye_slash,
                                          size: context.widthScale * 18,
                                          color: (provider.passwordErrorMessage == null)
                                              ? Colours.black
                                              : Colours.errorColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: context.widthScale * 24),
                                      child: CoreTypography.coreText(
                                        text: provider.passwordErrorMessage ?? '',
                                        color: Colours.errorColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        CoreButton(
                          onPressed: () {
                            provider.validateSignIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );

                            if (provider.isValidToSignIn) {
                              final params = SignInParams(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                              context.authBloc.add(SignInEvent(params));
                            }
                          },
                          text: 'Sign In',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
