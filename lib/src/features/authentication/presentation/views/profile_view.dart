import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';
import '../../../../core/shared/widgets/core_button.dart';
import '../bloc/authentication_bloc.dart';
import '../providers/user_provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (_, provider, __) => Container(
        width: context.width,
        padding: EdgeInsets.fromLTRB(
          context.widthScale * 20,
          0,
          context.widthScale * 20,
          context.widthScale * 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: context.heightScale * 8,
              children: [
                Icon(
                  CupertinoIcons.profile_circled,
                  size: context.widthScale * 120,
                  weight: 0.5,
                  color: Colours.grey,
                ),
                Column(
                  children: [
                    CoreTypography.coreText(
                      text: provider.currentUser!.name,
                      fontSize: 16,
                      fontWeight: CoreTypography.bold,
                      color: Colours.primaryBlue,
                    ),
                    CoreTypography.coreText(
                      text: provider.currentUser!.email,
                      fontSize: 14,
                    ),
                    CoreTypography.coreText(
                      text: provider.currentUser!.phoneNumber,
                      fontSize: 14,
                    ),
                  ],
                ),
                IntrinsicWidth(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colours.verifyColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(context.widthScale * 8),
                    child: Center(
                      child: CoreTypography.coreText(
                        text: provider.currentUser!.role,
                        fontWeight: CoreTypography.semiBold,
                        color: Colours.primaryBlue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.heightScale * 16,
                ),
                Container(
                  width: context.width,
                  decoration: BoxDecoration(
                    color: Colours.blueVehicleDetailBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colours.greyEmptyImage),
                  ),
                  padding: EdgeInsets.all(context.widthScale * 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        spacing: context.heightScale * 12,
                        children: [
                          CoreTypography.coreText(
                            text: 'Beli',
                            fontSize: 14,
                            color: Colours.grey,
                          ),
                          CoreTypography.coreText(
                            text: '100',
                            color: Colours.primaryBlue,
                            fontWeight: CoreTypography.semiBold,
                            fontSize: 24,
                          ),
                        ],
                      ),
                      Container(
                        width: 1,
                        height: context.heightScale * 72,
                        color: Colours.greyEmptyImage,
                      ),
                      Column(
                        spacing: context.heightScale * 12,
                        children: [
                          CoreTypography.coreText(
                            text: 'Jual',
                            fontSize: 14,
                            color: Colours.grey,
                          ),
                          CoreTypography.coreText(
                            text: '100',
                            color: Colours.primaryBlue,
                            fontWeight: CoreTypography.semiBold,
                            fontSize: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            CoreButton(
              onPressed: () {
                context.authBloc.add(const SignOutEvent());
              },
              text: 'Sign Out',
              foregroundColor: Colours.errorColor,
              backgroundColor: Colours.white,
              borderColor: Colours.errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
