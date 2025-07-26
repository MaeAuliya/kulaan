import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../providers/navigation_controller.dart';
import '../widgets/nav_item.dart';

class UserBottomNavigationCore extends StatefulWidget {
  const UserBottomNavigationCore({
    super.key,
    this.startIndex = 0,
  });

  static const routeName = '/user-bottom_navigation';

  final int startIndex;

  @override
  State<UserBottomNavigationCore> createState() =>
      _UserBottomNavigationCoreState();
}

class _UserBottomNavigationCoreState extends State<UserBottomNavigationCore> {
  @override
  void initState() {
    context.bottomNavigator.getScreens(widget.startIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (_, controller, __) => PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;
          if (controller.currentIndex > 0) {
            controller.backToHome();
          } else {
            SystemNavigator.pop();
          }
        },
        child: Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 10,
              ),
            ]),
            child: BottomAppBar(
              elevation: 10,
              color: Colours.white,
              height: context.widthScale * 64,
              padding: const EdgeInsets.all(8),
              shadowColor: Colours.black.withValues(alpha: 0.2),
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NavItem(
                      currentIndex: controller.currentIndex,
                      index: 0,
                      icon: CupertinoIcons.home,
                      label: 'Home',
                      onSelected: (index) {
                        controller.changeIndex(index);
                      },
                    ),
                    NavItem(
                      currentIndex: controller.currentIndex,
                      index: 1,
                      icon: CupertinoIcons.cart,
                      label: 'Order',
                      onSelected: (index) {
                        controller.changeIndex(index);
                      },
                    ),
                    NavItem(
                      currentIndex: controller.currentIndex,
                      index: 2,
                      icon: Icons.history,
                      label: 'History',
                      onSelected: (index) {
                        controller.changeIndex(index);
                      },
                    ),
                    NavItem(
                      currentIndex: controller.currentIndex,
                      index: 3,
                      icon: CupertinoIcons.profile_circled,
                      label: 'Profile',
                      onSelected: (index) {
                        controller.changeIndex(index);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SafeArea(
            top: false,
            child: IndexedStack(
              index: controller.currentIndex,
              children: controller.screens,
            ),
          ),
        ),
      ),
    );
  }
}
